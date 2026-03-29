import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/pages/numerals/numerals_done.dart';
import 'package:vocabyte/pages/numerals/numerals_page.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/repository/app_rep.dart';

class NumeralsNav extends StatefulWidget {
  const NumeralsNav({super.key});
  @override
  NumeralsNavState createState() => NumeralsNavState();
}

enum NumPageType { idle, numerals, completed }

class NumeralsNavState extends State<NumeralsNav> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _dispStream = DisposableStream();
  final tag = 'numerals';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dispStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.page,
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.page,
                leadingWidth: double.infinity,
                leading: AppBar2(
                    type: Type.close,
                    child: StreamBuilder(
                        stream: getIt<AppRep>().onNumeralsProgress,
                        initialData:
                            getIt<AppRep>().onNumeralsProgress.valueOrNull,
                        builder: (context, snapshot) {
                          var percent = snapshot.data ?? 0.0;
                          var step = (percent * 10).toInt();
                          return Flexible(
                              child: Row(children: [
                            const Spacer(),
                            StreamBuilder(
                                stream: getIt<AppRep>().onNumeralsStage,
                                initialData:
                                    getIt<AppRep>().onNumeralsStage.valueOrNull,
                                builder: (context, snapshot) {
                                  var data = snapshot.data;
                                  return Text(
                                      data == null
                                          ? ''
                                          : '${data.stage + 1} of ${data.all}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .iconColor));
                                }),
                            const Spacer(),
                            CircularStepProgressIndicator(
                                totalSteps: 10,
                                currentStep: step,
                                width: 30,
                                height: 30,
                                roundedCap: (_, isSelected) => isSelected)
                          ]));
                        }))),
            body: Container(
                color: Theme.of(context).colorScheme.page,
                width: size.width,
                height: size.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_navigator()]))));
  }

  Widget _navigator() {
    return Expanded(
        child: Navigator(
            key: _navigatorKey,
            initialRoute: NumPageType.numerals.name,
            onGenerateRoute: (RouteSettings settings) {
              var type = UiHelper().routeNumeralsNameToType(settings.name);
              switch (type) {
                //
                // empty
                case NumPageType.idle:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) => const SizedBox());
                //
                // numerals
                case NumPageType.numerals:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) =>
                          NumeralsPage(onCompleted: (res) {
                            _navigatorKey.currentState?.pushReplacementNamed(
                                NumPageType.completed.name,
                                arguments: {'result': res});
                          }));
                case NumPageType.completed:
                  return PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                      settings: RouteSettings(name: type.name),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (_, __, ___) => NumeralsCompleted(
                          result: UiHelper.getRouteArg(
                              settings.arguments, 'result'),
                          onCompleted: () {
                            Navigator.of(context).pop();
                          }));
              }
            }));
  }
}
