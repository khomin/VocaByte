import 'dart:async';
import 'package:flutter_rustore_pay/api/flutter_rustore_pay_client.dart';
import 'package:flutter_rustore_pay/model/purchase.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PaymentService {
  bool isSupported();

  Future<bool> isPremium();
  Future<bool> processPremium();
  Future<String?> getPrice();

  Stream<String?> get priceStream;
  Stream<bool> get premiumStatusStream;
}

class GooglePaymentService implements PaymentService {
  @override
  bool isSupported() => false;

  @override
  Future<bool> processPremium() async {
    return false;
  }

  @override
  Future<bool> isPremium() async {
    return false;
  }

  @override
  Stream<String?> get priceStream => throw UnimplementedError();

  @override
  Stream<bool> get premiumStatusStream => throw UnimplementedError();

  @override
  Future<String?> getPrice() => throw UnimplementedError();
}

class RuStorePaymentService implements PaymentService {
  final _stream = BehaviorSubject<bool>.seeded(false);
  final _priceStream = BehaviorSubject<String?>();
  Timer? _retryPriceTimer;
  Timer? _retryPremiumStatusTimer;
  final _products = ['premium_features_unlock'];
  final _priceKey = 'price';
  final _premiumKey = 'is_premium';
  final _lastPremiumCheckKey = 'last_premium_check_timestamp';
  final tag = 'rustrore';

  RuStorePaymentService() {
    getPrice();
    isPremium();
  }

  @override
  Stream<String?> get priceStream => _priceStream.stream;

  @override
  Stream<bool> get premiumStatusStream => _stream.stream;

  @override
  bool isSupported() => true;

  @override
  Future<String?> getPrice() async {
    final prefs = await SharedPreferences.getInstance();
    var cachedPrice = prefs.getString(_priceKey);
    if (cachedPrice != null) {
      _priceStream.add(cachedPrice);
    }
    try {
      var price = await getPriceSdk();
      if (price != null) {
        await prefs.setString(_priceKey, price);
        _priceStream.add(price);
      }
      return price;
    } catch (e) {
      logWarning('$tag: failed to get price [$e]');
    }
    return null;
  }

  @override
  Future<bool> isPremium() async {
    final prefs = await SharedPreferences.getInstance();
    bool cachedStatus = prefs.getBool(_premiumKey) ?? false;
    int lastCheck = prefs.getInt(_lastPremiumCheckKey) ?? 0;
    _stream.add(cachedStatus);
    try {
      var currentStatus = await checkPremiumSdk();
      var nowMs = DateTime.now().millisecondsSinceEpoch;
      await prefs.setBool(_premiumKey, currentStatus);
      await prefs.setInt(_lastPremiumCheckKey, nowMs);
      _stream.add(currentStatus);
    } catch (e) {
      bool isCacheExpired =
          DateTime.now().millisecondsSinceEpoch - lastCheck > 2592000000;
      startPremiumStatusRetryTimer();
      if (isCacheExpired) {
        return false;
      }
    }
    return cachedStatus;
  }

  Future<bool> checkPremiumSdk() async {
    final it = RuStorePayClient.instance.purchaseInteractor;
    final purchases = await it.getPurchases();
    bool currentStatus = purchases.any(
      (p) => p.status == ProductPurchaseStatus.confirmed,
    );
    return currentStatus;
  }

  Future<String?> getPriceSdk() async {
    final it = RuStorePayClient.instance.productInteractor;
    final products = await it.getProducts(_products);
    if (products.isNotEmpty) {
      return products.first.amountLabel;
    }
    return null;
  }

  @override
  Future<bool> processPremium() async {
    try {
      final it = RuStorePayClient.instance.productInteractor;
      var product = await it.getProducts(_products);
      logInfo('$tag: purchase, product [$product]');
      var res = await RuStorePayClient.instance.purchaseInteractor.purchase(
        product.first.productId,
      );
      logInfo('$tag: purchase result [$res] ');
      isPremium();
      return true;
    } catch (ex) {
      logError('$tag: ex $ex');
    }
    return false;
  }

  void startPriceRetryTimer() {
    _retryPriceTimer?.cancel();
    _retryPriceTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final price = await getPriceSdk();
        final prefs = await SharedPreferences.getInstance();
        if (price != null) {
          await prefs.setString(_priceKey, price);
          _priceStream.add(price);
        }
        timer.cancel();
      } catch (_) {}
    });
  }

  void startPremiumStatusRetryTimer() {
    _retryPremiumStatusTimer?.cancel();
    _retryPremiumStatusTimer =
        Timer.periodic(const Duration(seconds: 3), (timer) async {
      try {
        final currentStatus = await checkPremiumSdk();
        var nowMs = DateTime.now().millisecondsSinceEpoch;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_premiumKey, currentStatus);
        await prefs.setInt(_lastPremiumCheckKey, nowMs);
        _stream.add(currentStatus);
        timer.cancel();
      } catch (_) {}
    });
  }
}
