import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/app/app_theme.dart';

enum ReviewTime { today, day1, week1, month1, month3 }

class NextReviewPanel extends StatefulWidget {
  const NextReviewPanel(
      {required this.review,
      required this.onChanged,
      required this.onAlreadyKnow,
      super.key});
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
    var size = MediaQuery.of(context).size;
    var paddingSide = size.width / 6;
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Please select next review time',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.dialogHeaderText2))
      ]),
      const SizedBox(height: 10),
      ButtonRoundCorner(
          padding: EdgeInsets.only(left: paddingSide, right: paddingSide),
          text: "Already know",
          color: Theme.of(context).colorScheme.buttonOption2,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            widget.onAlreadyKnow();
            Navigator.of(context).pop();
          }),
      ButtonRoundCorner(
          padding:
              EdgeInsets.only(left: paddingSide, right: paddingSide, top: 8),
          text: "Today",
          color: Theme.of(context).colorScheme.buttonOption1,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            _reviewValue = ReviewTime.today;
            widget.onChanged.call(_reviewValue);
            Navigator.of(context).pop();
          }),
      ButtonRoundCorner(
          padding:
              EdgeInsets.only(left: paddingSide, right: paddingSide, top: 8),
          text: "1 day",
          color: Theme.of(context).colorScheme.buttonOption1,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            _reviewValue = ReviewTime.day1;
            widget.onChanged.call(_reviewValue);
            Navigator.of(context).pop();
          }),
      ButtonRoundCorner(
          padding:
              EdgeInsets.only(left: paddingSide, right: paddingSide, top: 8),
          text: "1 week",
          color: Theme.of(context).colorScheme.buttonOption1,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            _reviewValue = ReviewTime.week1;
            widget.onChanged.call(_reviewValue);
            Navigator.of(context).pop();
          }),
      ButtonRoundCorner(
          padding:
              EdgeInsets.only(left: paddingSide, right: paddingSide, top: 8),
          text: "1 month",
          color: Theme.of(context).colorScheme.buttonOption1,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            _reviewValue = ReviewTime.month1;
            widget.onChanged.call(_reviewValue);
            Navigator.of(context).pop();
          }),
      ButtonRoundCorner(
          padding:
              EdgeInsets.only(left: paddingSide, right: paddingSide, top: 8),
          text: "3 month",
          color: Theme.of(context).colorScheme.buttonOption1,
          colorText: Theme.of(context).colorScheme.cardText,
          direction: TextDirection.ltr,
          radious: const BorderRadius.all(Radius.circular(10)),
          onPressed: () {
            _reviewValue = ReviewTime.month3;
            widget.onChanged.call(_reviewValue);
            Navigator.of(context).pop();
          })
    ]);
  }
}
