import 'package:flutter/material.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/components/round_button.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';

enum ReviewTime { today, day1, week1, month1, month3 }

class NextReviewPanel extends StatefulWidget {
  const NextReviewPanel({
    required this.review,
    required this.onChanged,
    required this.onAlreadyKnow,
    super.key,
  });
  final ReviewTime review;
  final Function(ReviewTime review) onChanged;
  final Function() onAlreadyKnow;

  @override
  NextReviewPanelState createState() => NextReviewPanelState();
}

class NextReviewPanelState extends State<NextReviewPanel> {
  late ReviewTime _reviewValue;

  @override
  void initState() {
    super.initState();
    _reviewValue = widget.review;
  }

  void _set(ReviewTime value) {
    _reviewValue = value;
    widget.onChanged.call(_reviewValue);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.paddingOf(context);
    return Padding(
        padding: EdgeInsets.only(bottom: padding.bottom),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(height: 10),
          SizedBox(
              height: 50,
              child: Stack(children: [
                Positioned(
                    right: 10,
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Please select next review time',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .dialogHeaderText))
                        ])),
                Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: RoundButton(
                        color: Colors.white.withValues(alpha: 0.08),
                        iconColor:
                            Theme.of(context).colorScheme.appBarText.color,
                        height: Constants.baseButton,
                        width: Constants.baseButton,
                        iconSize: 22,
                        radius: 20,
                        iconData: Icons.close,
                        onPressed: (p0) {
                          Navigator.of(context).pop();
                        }))
              ])),
          const SizedBox(height: 15),
          Column(children: [
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                onClicked: (pos) {
                  _reviewValue = ReviewTime.today;
                  widget.onChanged.call(_reviewValue);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Today',
                  style: Theme.of(context).colorScheme.title1,
                )),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                onClicked: (pos) {
                  _set(ReviewTime.day1);
                },
                child: Text(
                  'In 1 day',
                  style: Theme.of(context).colorScheme.title1,
                )),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                onClicked: (pos) {
                  _set(ReviewTime.week1);
                },
                child: Text(
                  'In 1 week',
                  style: Theme.of(context).colorScheme.title1,
                )),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                onClicked: (pos) {
                  _set(ReviewTime.month1);
                },
                child: Text(
                  'In 1 month',
                  style: Theme.of(context).colorScheme.title1,
                )),
            ItemInMenuList(
                useBorderTop: false,
                useBorderBot: true,
                onClicked: (pos) {
                  _set(ReviewTime.month3);
                },
                child: Text(
                  'In 3 months',
                  style: Theme.of(context).colorScheme.title1,
                )),
            Container(
                color: Theme.of(context).colorScheme.buttonOption2,
                child: ItemInMenuList(
                    useBorderTop: true,
                    useBorderBot: true,
                    onClicked: (pos) {
                      widget.onAlreadyKnow();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Already know',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.button3TextInversed,
                        fontSize: 14,
                        fontFamily: Constants.fontInter,
                        fontWeight: FontWeight.w600,
                      ),
                    ))),
          ])
        ]));
  }
}
