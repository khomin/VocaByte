import 'package:loggy/loggy.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class PageAbout extends StatefulWidget {
  const PageAbout({super.key});

  @override
  State<PageAbout> createState() => _State();
}

class _State extends State<PageAbout> {
  final tag = 'PageAbout';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
          color: Theme.of(context).colorScheme.baseColor1, child: _layout());
    });
  }

  Widget _layout() {
    return CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HTML.toRichText(context, """<span style="font-size:14px">
                        VocaByte
                        <br/>
                        <br/>
                        This app is designed to be fast and efficient
                        <br/>
                        <br/>
                        We have focused on optimizing performance to make sure that your interactions are seamless
                        <br/>
                        <br/>
                        We would like to thank you for choosing our app
                        <br/>
                        <br/>
                        Your support and feedback are invaluable to us
                        <br/>
                        <br/>
                        If you have any questions, suggestions, or need support, please feel free to contact at: <a href="mailto: hominvladimir@gmail.com">hominvladimir@gmail.com</a>
                      </span>""", linksCallback: (p0) {
                try {
                  logDebug('linkL $p0');
                  url_launcher.launchUrl(Uri.parse(p0));
                } catch (ex) {
                  logWarning('$tag: launch link ex: $ex');
                }
              },
                  defaultTextStyle:
                      TextStyle(color: Theme.of(context).colorScheme.cardText)),
            ]));
      }, childCount: 1)),
    ]);
  }
}
