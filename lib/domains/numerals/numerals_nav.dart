import 'package:vocabyte/components/disposable_stream.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/domains/numerals/numerals_done.dart';
import 'package:vocabyte/domains/numerals/numerals_page.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/ui_helper.dart';

class NumeralsNav extends StatefulWidget {
  const NumeralsNav({required this.onBack, super.key});
  final Function onBack;
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
    var size = MediaQuery.of(context).size;
    return Container(
        color: Theme.of(context).colorScheme.page,
        width: size.width,
        height: size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_navigator()]));
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
                      pageBuilder: (_, __, ___) => NumeralsPage(onDone: (res) {
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
                      pageBuilder: (_, __, ___) => NumeralsDone(
                          result: UiHelper.getRouteArg(
                              settings.arguments, 'result'),
                          onDone: () {
                            widget.onBack();
                          }));
              }
            }));
  }
}
