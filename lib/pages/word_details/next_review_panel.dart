import 'package:flutter/material.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/components/round_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const SizedBox(height: 10),
      SizedBox(
          height: 50,
          child: Stack(children: [
            Positioned(
                right: 10,
                left: 10,
                top: 0,
                bottom: 0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Please select next review time',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).colorScheme.dialogHeaderText))
                ])),
            Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: RoundButton(
                    color: Colors.white.withValues(alpha: 0.08),
                    iconColor: Theme.of(context).colorScheme.appBarText.color,
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
            useBorderTop: true,
            useBorderBot: true,
            onClicked: (pos) {
              widget.onAlreadyKnow();
              Navigator.of(context).pop();
            },
            child: Text('Already know',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.buttonOption2))),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            onClicked: (pos) {
              _reviewValue = ReviewTime.today;
              widget.onChanged.call(_reviewValue);
              Navigator.of(context).pop();
            },
            child: Text('Today',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.title1.color))),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            onClicked: (pos) {
              _reviewValue = ReviewTime.day1;
              widget.onChanged.call(_reviewValue);
              Navigator.of(context).pop();
            },
            child: Text('In 1 day',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.title1.color))),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            onClicked: (pos) {
              _reviewValue = ReviewTime.week1;
              widget.onChanged.call(_reviewValue);
              Navigator.of(context).pop();
            },
            child: Text('In 1 week',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.title1.color))),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            onClicked: (pos) {
              _reviewValue = ReviewTime.month1;
              widget.onChanged.call(_reviewValue);
              Navigator.of(context).pop();
            },
            child: Text('In 1 month',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.title1.color))),
        ItemInMenuList(
            useBorderTop: false,
            useBorderBot: true,
            onClicked: (pos) {
              _reviewValue = ReviewTime.month3;
              widget.onChanged.call(_reviewValue);
              Navigator.of(context).pop();
            },
            child: Text('In 3 months',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.title1.color)))
      ])
    ]);
  }
}
