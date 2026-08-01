import 'dart:async';
import 'package:loggy/loggy.dart';
import 'package:rxdart/subjects.dart';

abstract class PaymentService {
  bool isSupported();

  Future<bool> isPremium({required bool cached});
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
  Future<bool> isPremium({required bool cached}) async {
    return false;
  }

  @override
  Stream<String?> get priceStream => throw UnimplementedError();

  @override
  Stream<bool> get premiumStatusStream => throw UnimplementedError();

  @override
  Future<String?> getPrice() => throw UnimplementedError();
}

class StorePaymentService implements PaymentService {
  final _stream = BehaviorSubject<bool>.seeded(false);
  final _priceStream = BehaviorSubject<String?>();
  final tag = 'paymentService';

  StorePaymentService() {
    getPrice();
    isPremium(cached: false);
  }

  @override
  Stream<String?> get priceStream => _priceStream.stream;

  @override
  Stream<bool> get premiumStatusStream => _stream.stream;

  @override
  bool isSupported() => true;

  @override
  Future<String?> getPrice() async {
    logInfo('not implemented');
    return null;
  }

  @override
  Future<bool> isPremium({required bool cached}) async {
    logInfo('not implemented');
    return false;
  }

  Future<bool> checkPremiumSdk() async {
    logInfo('not implemented');
    return false;
  }

  Future<String?> getPriceSdk() async {
    logInfo('not implemented');
    return null;
  }

  @override
  Future<bool> processPremium() async {
    logInfo('not implemented');
    return false;
  }
}
