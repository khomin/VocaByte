import 'dart:async';

import 'package:flutter_rustore_pay/api/flutter_rustore_pay_client.dart';
import 'package:flutter_rustore_pay/model/purchase.dart';
import 'package:flutter_rustore_pay/model/purchase_type.dart';
import 'package:loggy/loggy.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PaymentService {
  bool isSupported();

  Future<bool> processPremium();

  Future<bool> isPremium();

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
  Stream<bool> get premiumStatusStream => throw UnimplementedError();
}

class RuStorePaymentService implements PaymentService {
  final _stream = BehaviorSubject<bool>.seeded(false);
  final tag = 'rustrore';

  RuStorePaymentService() {
    isPremium();
  }

  @override
  Stream<bool> get premiumStatusStream => _stream.stream;

  @override
  bool isSupported() => true;

  @override
  Future<bool> processPremium() async {
    try {
      final it = RuStorePayClient.instance.productInteractor;
      var product = await it.getProducts(['premium_features_unlock']);
      logInfo('info=$product');
      var res = await RuStorePayClient.instance.purchaseInteractor.purchase(
        product.first.productId,
      );
      logInfo('info2=$res');
      isPremium();
      return true;
    } catch (ex) {
      logError('$tag: ex $ex');
    }
    return false;
  }

  @override
  Future<bool> isPremium() async {
    final prefs = await SharedPreferences.getInstance();
    bool cachedStatus = prefs.getBool('is_premium') ?? false;
    int lastCheck = prefs.getInt('last_premium_check_timestamp') ?? 0;
    _stream.add(cachedStatus);
    try {
      final it = RuStorePayClient.instance.purchaseInteractor;
      final purchases = await it.getPurchases();
      bool currentStatus =
          purchases.any((p) => p.status == ProductPurchaseStatus.confirmed);

      await prefs.setBool('is_premium', currentStatus);
      await prefs.setInt('last_premium_check_timestamp',
          DateTime.now().millisecondsSinceEpoch);
      _stream.add(currentStatus);

      return currentStatus;
    } catch (e) {
      bool isCacheExpired =
          DateTime.now().millisecondsSinceEpoch - lastCheck > 2592000000;

      if (isCacheExpired) {
        return false;
      }
      return cachedStatus;
    }
  }
}
