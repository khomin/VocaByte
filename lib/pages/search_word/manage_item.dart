import 'package:flutter/material.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/main.dart';
import 'package:vocabyte/repository/app_rep.dart';
import 'package:vocabyte/repository/app_theme.dart';
import 'package:vocabyte/resource/constants.dart';
import 'package:vocabyte/app/ui_helper.dart';
import 'package:vocabyte/services/protobuf/app.pb.dart';

class ManageWordItem extends StatefulWidget {
  const ManageWordItem({
    required this.data,
    this.onClicked,
    super.key,
  });
  final WordInReview data;
  final Function? onClicked;

  @override
  State<ManageWordItem> createState() => _State();
}

class _State extends State<ManageWordItem> {
  String? _comment;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (widget.data.successCount < Constants.reapedToLeanDefault) {
        var reviewIn = getIt<AppRep>().reviewTimeInDuration(widget.data);
        _comment = getIt<AppRep>().reviewInToString(reviewIn);
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
    return ItemInMenuList(
        useBorderTop: false,
        useBorderBot: true,
        onClicked: (pos) {
          widget.onClicked?.call();
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 18),
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
                      //
                      if (widget.data.successCount >=
                          Constants.reapedToLeanDefault)
                        const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(Icons.thumb_up, size: 15)),
                      //
                      //
                      Text('$_comment',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.cardText))
                    ]),
                    //
                    //
                    if (widget.data.successCount <
                        Constants.reapedToLeanDefault)
                      Text('Remember ${widget.data.successCount} times',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.cardText)),
                  ]),
              const SizedBox(width: 18)
            ]));
  }
}
