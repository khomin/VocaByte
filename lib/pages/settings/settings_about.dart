import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocabyte/components/app_bar2.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/resource/constants.dart';

class SettingsAbout extends StatefulWidget {
  const SettingsAbout({super.key});

  @override
  State<SettingsAbout> createState() => SettingsAboutState();
}

class SettingsAboutState extends State<SettingsAbout> {
  final tag = 'settingsAbout';

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.baseColor1,
            body: CustomScrollView(
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    primary: false,
                    toolbarHeight: Constants.homeAppBarHeight + padding.top,
                    automaticallyImplyLeading: false,
                    backgroundColor: Theme.of(context).colorScheme.appBar,
                    surfaceTintColor: Colors.transparent,
                    titleSpacing: 0,
                    title: Container(
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        child: Container(
                            padding: EdgeInsets.only(top: padding.top),
                            height: Constants.homeAppBarHeight + padding.top,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: _buildTopBar()),
                      ),
                    ),
                  ),
                  //
                  DecoratedSliver(
                      decoration: const BoxDecoration(),
                      sliver: SliverToBoxAdapter(
                        child: _body(),
                      ))
                ])));
  }

  Widget _buildTopBar() {
    return Stack(alignment: AlignmentGeometry.center, children: [
      Row(children: [
        Container(
          height: Constants.baseButton,
          width: Constants.baseButton,
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: RoundButton(
              color: Theme.of(context).colorScheme.roundButton,
              height: Constants.baseButton,
              width: Constants.baseButton,
              iconData: Icons.arrow_back_ios,
              padding: const EdgeInsets.only(left: 5),
              iconSize: 22,
              radius: 20,
              onPressed: (_) {
                Navigator.of(context).pop();
              }),
        ),
      ]),
      Center(
          child: Text(
        'About',
        style: TextStyle(
          color: Theme.of(context).colorScheme.iconColor,
          fontSize: 16,
        ),
      )),
    ]);
  }

  Widget _body() {
    return Builder(builder: (context) {
      return Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Constants.appName,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text('This app is lightweight and free, with no ads',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                Text(
                    'It combines the power of word cards and numeral training to help you improve your language skills and number recognition',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                Text(
                    'Simply type a word into the search bar to instantly access its card with detailed examples, making it easy to understand and remember',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 8),
                Text('We hope this app can help you find a use for that',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 30),
                Text('We also have a group for bugs & ideas:',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.appBarText.color,
                        fontSize: Constants.menuFontSize1,
                        fontWeight: FontWeight.w400)),
                ItemInMenuList(
                    useBorderTop: false,
                    useBorderBot: false,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.zero,
                    onClicked: (pos) {},
                    child: Row(children: [
                      Text(Constants.appGroupLink,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.title2.color,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      RoundButton(
                          color: Theme.of(context).colorScheme.roundButton,
                          height: Constants.baseButton,
                          width: Constants.baseButton,
                          iconSize: 20,
                          margin: const EdgeInsets.only(left: 10),
                          useScaleAnimation: true,
                          iconData: Icons.copy,
                          onPressed: (v) async {
                            Clipboard.setData(const ClipboardData(
                                text: Constants.appGroupLink));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content: Text('Copied')),
                            );
                          })
                    ]))
              ]));
    });
  }

  bool isValidIP(String ip) {
    try {
      InternetAddress(ip);
      return true; // Valid IP
    } catch (e) {
      return false; // Invalid IP
    }
  }

  bool isValidURI(String uri) {
    try {
      if (uri.startsWith('https://') || uri.startsWith('http://')) {
        var v = Uri.parse(uri);
        return v.host.isNotEmpty; // Valid URI
      }
    } catch (_) {}
    return false; // Invalid URI
  }
}
