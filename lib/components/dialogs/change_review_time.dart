import 'package:flutter/material.dart';
import 'package:vocabyte/components/button_round_corner.dart';
import 'package:vocabyte/components/custom_checkbox.dart';
import 'package:vocabyte/components/dialogs/dialog_header.dart';
import 'package:vocabyte/components/hover_click_component.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';

enum ReviewTime { today, day1, week1, month1, month3 }

class ChangeReviewTime {
  void show(
      {required BuildContext context,
      required ReviewTime review,
      required Function(ReviewTime review) onSet}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Theme.of(context).colorScheme.dialogBackground,
          titlePadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.only(left: 10, right: 10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: UiHelper.isDesktop()
              ? DialogHeader(
                  text: '',
                  height: ConstValues.dialogHeaderMiddle,
                  close: () {
                    Navigator.pop(context);
                  })
              : null,
          children: <Widget>[
            SimpleDialogOption(
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Please select next review time',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ConstValues.dialogFontSize,
                                fontWeight: ConstValues.dialogHeaderFontWeight,
                                color: Theme.of(context)
                                    .colorScheme
                                    .dialogHeaderText2))
                      ]),
                ),
                //
                // checkboxes
                const SizedBox(height: 15),
                CheckBoxChooser(
                    review: review,
                    onChanged: (review_) {
                      review = review_;
                    }),

                const SizedBox(height: 30),
                ButtonRoundCorner(
                    iconData: Icons.arrow_left,
                    text: 'Continue',
                    color: Theme.of(context).colorScheme.buttonOption3,
                    colorText: Theme.of(context).colorScheme.cardText,
                    direction: TextDirection.rtl,
                    radious: const BorderRadius.all(Radius.circular(10)),
                    onPressed: () {
                      onSet(review);
                      Navigator.pop(context);
                    })
              ]),
            ),
          ],
        );
      },
    );
  }
}

class CheckBoxChooser extends StatefulWidget {
  const CheckBoxChooser(
      {required this.review, required this.onChanged, super.key});
  final ReviewTime review;
  final Function(ReviewTime) onChanged;

  @override
  State<CheckBoxChooser> createState() => CheckBoxChooserState();
}

class CheckBoxChooserState extends State<CheckBoxChooser> {
  late ReviewTime value;

  @override
  void initState() {
    super.initState();
    value = widget.review;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      //
      // today
      const SizedBox(height: 20),
      HoverClickComponent(
          onClick: () {
            value = ReviewTime.today;
            widget.onChanged.call(value);
            setState(() {});
          },
          child: Row(children: [
            CustomCheckBox(
                value: value == ReviewTime.today,
                onChanged: () {
                  value = ReviewTime.today;
                  widget.onChanged.call(value);
                  setState(() {});
                }),
            const SizedBox(width: 10),
            Text('Today',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.lightBlueText))
          ])),
      //
      // 1 day
      const SizedBox(height: 20),
      HoverClickComponent(
          onClick: () {
            value = ReviewTime.day1;
            widget.onChanged.call(value);
            setState(() {});
          },
          child: Row(children: [
            CustomCheckBox(
                value: value == ReviewTime.day1,
                onChanged: () {
                  value = ReviewTime.day1;
                  widget.onChanged.call(value);
                  setState(() {});
                }),
            const SizedBox(width: 10),
            Text('1 Day',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.lightBlueText))
          ])),
      //
      //
      const SizedBox(height: 20),
      HoverClickComponent(
          onClick: () {
            value = ReviewTime.week1;
            widget.onChanged.call(value);
            setState(() {});
          },
          child: Row(children: [
            CustomCheckBox(
                value: value == ReviewTime.week1,
                onChanged: () {
                  value = ReviewTime.week1;
                  widget.onChanged.call(value);
                  setState(() {});
                }),
            const SizedBox(width: 10),
            Text('1 week',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.lightBlueText))
          ])),
      //
      //
      const SizedBox(height: 20),
      HoverClickComponent(
          onClick: () {
            value = ReviewTime.month1;
            widget.onChanged.call(value);
            setState(() {});
          },
          child: Row(children: [
            CustomCheckBox(
                value: value == ReviewTime.month1,
                onChanged: () {
                  value = ReviewTime.month1;
                  widget.onChanged.call(value);
                  setState(() {});
                }),
            const SizedBox(width: 10),
            Text('1 month',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.lightBlueText))
          ])),
      //
      //
      const SizedBox(height: 20),
      HoverClickComponent(
          onClick: () {
            value = ReviewTime.month3;
            widget.onChanged.call(value);
            setState(() {});
          },
          child: Row(children: [
            CustomCheckBox(
                value: value == ReviewTime.month3,
                onChanged: () {
                  value = ReviewTime.month3;
                  widget.onChanged.call(value);
                  setState(() {});
                }),
            const SizedBox(width: 10),
            Text('3 month',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.lightBlueText))
          ]))
    ]);
  }
}
