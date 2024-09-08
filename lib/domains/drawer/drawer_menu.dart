import 'dart:io';
import 'package:provider/provider.dart';
import 'package:vocabyte/domains/drawer/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/domains/models/app_model.dart';

enum MenuPageType {
  account(0),
  home(1),
  settings(3),
  about(5),
  searchWord(6),
  wordDetails(7),
  reviewCard(8),
  manageWords(9),
  numerals(10),
  changeDailyGoal(11);

  const MenuPageType(this.value);
  final num value;
}

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _State();
}

class _State extends State<DrawerMenu> {
  late MenuItems menuItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Builder(builder: (BuildContext context) {
      return Container(
          color: Theme.of(context).colorScheme.menuActive,
          width: 300,
          child: Column(
            //
            // header
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                    margin: const EdgeInsets.all(30),
                    child: Text(
                      ConstValues.appName,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.menuActiveText),
                    ))
              ]),
              //
              // menu
              const MenuItems(),
              //
              // version
              Text(
                'version ${context.watch<AppModel>().appVersion}',
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.menuActiveText),
              ),
              const SizedBox(height: 10)
            ],
          ));
    }));
  }
}

final List<MenuMainData> menuList = [
  MenuMainData(
      name: 'User',
      comment: 'User',
      icon: Icons.supervised_user_circle_rounded,
      pageType: MenuPageType.account),
  MenuMainData(
      name: 'Home',
      comment: 'Home',
      icon: Icons.extension_rounded,
      pageType: MenuPageType.home),
  MenuMainData(
      name: 'Search',
      comment: 'word',
      icon: Icons.search,
      pageType: MenuPageType.searchWord),
  MenuMainData(
      name: 'Numerals',
      comment: 'word',
      icon: Icons.confirmation_number,
      pageType: MenuPageType.numerals),
  MenuMainData(
      name: 'Settings',
      comment: 'settings',
      icon: Icons.settings,
      pageType: MenuPageType.settings),
  MenuMainData(
      name: 'About',
      comment: 'about',
      icon: Icons.info,
      pageType: MenuPageType.about)
];

class MenuItems extends StatefulWidget {
  const MenuItems({
    super.key,
  });
  @override
  State<MenuItems> createState() => MenuItemsState();
}

class MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Expanded(
        child: ListView(physics: const ClampingScrollPhysics(), children: [
          for (var i in menuList)
            if (i.pageType != MenuPageType.account)
              MenuMainItem(
                  itemData: i,
                  onChanged: (page) {
                    context
                        .read<AppModel>()
                        .goToPage(page: page, replace: true);
                    if (Platform.isIOS || Platform.isAndroid) {
                      Navigator.pop(context);
                    }
                  })
        ]),
      );
    });
  }
}
