import 'package:vocabyte/components/button2.dart';
import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/file_utils.dart';

class TestPart extends StatefulWidget {
  const TestPart({super.key});

  @override
  TestPartState createState() => TestPartState();
}

class TestPartState extends State<TestPart> {
  final tag = 'test';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.page,
        child: Column(children: [
          Expanded(
              child: CustomScrollView(slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              SingleChildScrollView(
                  child: Column(children: [
                Row(children: [
                  Button2(
                      text: 'convert-epub',
                      iconData: Icons.conveyor_belt,
                      onPressed: () async {
                        await FileUtils.convertEpub(
                            fromDir:
                                '/home/khomin/Downloads/other/Chekhov, Anton - Collected works (57 books, different years of publication)',
                            toDir: '/home/khomin/Downloads/converted_2/');
                      })
                ]),
                Row(children: [
                  Button2(
                      text: 'create-dictionary',
                      iconData: Icons.conveyor_belt,
                      onPressed: () async {
                        await FileUtils.convertEpub(
                            fromDir:
                                '/home/khomin/Downloads/other/Chekhov, Anton - Collected works (57 books, different years of publication)',
                            toDir: '/home/khomin/Downloads/converted_2/');
                      })
                ])
              ]))
            ]))
          ]))
        ]));
  }
}
