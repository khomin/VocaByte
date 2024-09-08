import 'package:flutter/material.dart';
import 'package:vocabyte/components/hover_click_component.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:vocabyte/app/const_values.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/protobuf/proto.pb.dart';

class ManageWordItem extends StatefulWidget {
  const ManageWordItem({required this.data, this.onClicked, super.key});
  final WordInReview data;
  final Function? onClicked;

  @override
  State<ManageWordItem> createState() => _State();
}

class _State extends State<ManageWordItem> {
  bool isHover = false;
  String? _comment;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (widget.data.successCount < ConstValues.reapedToLeanDefault) {
        var reviewIn = AppRep().reviewTimeInDuration(widget.data);
        _comment = AppRep().reviewInToString(reviewIn);
        if (mounted) {
          setState(() {});
        }
      } else {
        setState(() {
          _comment = 'Completed';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return HoverClickComponent(
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
        },
        onClick: () {
          widget.onClicked?.call();
        },
        child: Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.listSplit))),
            child: Column(children: [
              Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    const SizedBox(width: 15),
                    //
                    // word
                    Expanded(
                        child: Row(children: [
                      Expanded(
                          child: Text(UiHelper.toFormatText(widget.data.word),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.text3)))
                    ])),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            //
                            // 1
                            if (widget.data.successCount >=
                                ConstValues.reapedToLeanDefault)
                              const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Icon(Icons.thumb_up, size: 15)),
                            //
                            // 2
                            Text('$_comment',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).colorScheme.cardText))
                          ]),
                          //
                          // 3
                          if (widget.data.successCount <
                              ConstValues.reapedToLeanDefault)
                            Text('Remember ${widget.data.successCount} times',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .cardText)),
                        ]),
                    const SizedBox(width: 10)
                  ]))
            ])));
  }
}
