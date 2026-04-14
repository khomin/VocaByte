import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/models/app_model.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/payment_service.dart';
import 'package:vocabyte/repository/settings_rep.dart';
import 'package:vocabyte/resource/constants.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<AppRep>(() => AppRep());

  if (AppConfig.shared.flavor == FlavorType.google) {
    getIt.registerLazySingleton<PaymentService>(() => GooglePaymentService());
  } else if (AppConfig.shared.flavor == FlavorType.rustore) {
    getIt.registerLazySingleton<PaymentService>(() => RuStorePaymentService());
  }
}

void runMyFlavoredApp(FlavorType flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.instantiate(flavor);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    statusBarColor: Colors.transparent,
  ));

  // Load everything up front
  final results = await Future.wait([
    SettingsRep().getTheme(),
    initDependencies(),
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppModel(theme: results[0] as ThemeMode),
      child: const MainApp(),
    ),
  );
}
