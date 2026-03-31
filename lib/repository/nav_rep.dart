// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:vocabyte/app/utils.dart';

// // enum PageType { home, searchWord, reviewCard, manageWords, settings }

// class Panel {
//   Panel({
//     // required this.type,
//     this.arg,
//     this.fullPop = false,
//     this.replace = false,
//     this.onePop = false,
//   });
//   // final PageType type;
//   final dynamic arg;
//   final bool fullPop;
//   final bool replace;
//   final bool onePop;
// }

// class NavigatorRep {
//   final routeBloc = PanelRouterBlocSecondary();
//   final onLayoutChanged = BehaviorSubject<ScreenLayoutType>();

//   Future<bool> Function()? onCheckPopAllowed;

//   static const tag = 'navRep';
//   static NavigatorRep? _instance;

//   NavigatorRep._internal();
//   factory NavigatorRep() {
//     _instance ??= NavigatorRep._internal();
//     return _instance!;
//   }

//   void dispose() {}
// }

// class PanelRouterBlocSecondary {
//   final onGoto = PublishSubject<Panel?>();
//   final onHideBottom = BehaviorSubject<bool>.seeded(false);
//   final onCurrent = BehaviorSubject<Panel?>();
//   final navKey = GlobalKey<NavigatorState>();

//   void goto(Panel panel) {
//     if (_checkPaneTheSameAsCurrent(panel, onCurrent.valueOrNull)) {
//       return;
//     }
//     if (panel.fullPop) {
//       fullPop();
//     }
//     onGoto.add(panel);
//   }

//   void fullPop() {
//     onGoto.add(null);
//   }

//   void dispose() {
//     onGoto.close();
//   }

//   bool _checkPaneTheSameAsCurrent(Panel panel, Panel? current) {
//     return false;
//   }

//   // void onChanged(String name, dynamic arg) {
//   //   var route = routeNameTo(name);
//   //   onCurrent.add(Panel(type: route, arg: arg));
//   //   NavigatorRep().onCheckPopAllowed = null;
//   // }

//   void onDidPop() {
//     if (navKey.currentState?.canPop() == false) {
//       onCurrent.add(null);
//     }
//   }

//   // PageType routeNameTo(String? name) {
//   //   for (var it in PageType.values) {
//   //     if (it.name == name) {
//   //       return it;
//   //     }
//   //   }
//   //   return PageType.home;
//   // }

//   // String routeName(PageType? v) {
//   //   if (v == null) return '';
//   //   switch (v) {
//   //     case PageType.home:
//   //       return 'Home';
//   //     case PageType.searchWord:
//   //       return 'Search';
//   //     case PageType.reviewCard:
//   //       return 'Review';
//   //     case PageType.manageWords:
//   //       return 'Manage words';
//   //     case PageType.settings:
//   //       return 'Settings';
//   //   }
//   // }
// }
