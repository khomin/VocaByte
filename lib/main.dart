import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vocabyte/app.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/pages/models/app_model.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton<AppRep>(() => AppRep());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  SystemUiOverlayStyle _getSystemStyle(BuildContext context, ThemeMode mode) {
    var color = Theme.of(context).colorScheme.bottomNavBg;
    return SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      // statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Theme.of(context).colorScheme.dark()
          ? Brightness.light
          : Brightness.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppModel>(
        create: (context) => AppModel(),
        builder: (context, child) {
          var theme = context.select<AppModel, ThemeMode>((v) => v.theme);
          return MaterialApp(
              title: Constants.appName,
              themeMode: theme,
              theme: ThemeData(
                brightness: Brightness.light,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
              ),
              home: AnnotatedRegion<SystemUiOverlayStyle>(
                value: _getSystemStyle(context, ThemeMode.light),
                child: const App(),
              ));
        });
  }
}
