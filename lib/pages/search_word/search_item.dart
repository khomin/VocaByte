import 'package:flutter/material.dart';
import 'package:vocabyte/components/item_in_menu_list.dart';
import 'package:vocabyte/models/search_word_model.dart';
import 'package:vocabyte/models/word_data.dart';
import 'package:vocabyte/repository/app_theme.dart';

class SearchWordItem extends StatefulWidget {
  const SearchWordItem({
    required this.data,
    required this.isFirst,
    required this.isLast,
    required this.onPressed,
    super.key,
  });
  final SearchInfo data;
  final Function() onPressed;
  final bool isFirst;
  final bool isLast;

  @override
  State<SearchWordItem> createState() => _State();
}

class _State extends State<SearchWordItem> {
  Meaning? _meaning;
  String _synonyms = '';

  @override
  void initState() {
    super.initState();

    if (widget.data.meaning.isNotEmpty) {
      _meaning = widget.data.meaning[0];
    }
    if (_meaning != null && (_meaning?.synonyms.isNotEmpty ?? false)) {
      _synonyms = _meaning?.synonyms.join(' ') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: widget.isFirst ? const Radius.circular(8) : Radius.zero,
          topRight: widget.isFirst ? const Radius.circular(8) : Radius.zero,
          bottomLeft: widget.isLast ? const Radius.circular(8) : Radius.zero,
          bottomRight: widget.isLast ? const Radius.circular(8) : Radius.zero,
        ),
        color: Theme.of(context).colorScheme.pageHome,
      ),
      child: ItemInMenuList(
          useBorderTop: false,
          useBorderBot: !widget.isLast,
          onClicked: (pos) {
            widget.onPressed();
          },
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //
            // word, synonyms
            Flexible(
                child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //
                    // text
                    Text(
                      widget.data.word,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.text3),
                    ),
                    //
                    // synonyms
                    if (_synonyms.isNotEmpty)
                      Text(
                        _synonyms,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.text5),
                      ),
                  ]),
            )),
            Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Row(children: [
                  //
                  // in study
                  if (widget.data.isInStudy)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.school_outlined,
                        size: 20,
                        color: Theme.of(context).colorScheme.text5,
                      ),
                    ),
                  //
                  // populariry
                  Text(widget.data.freq >= 0 ? '${widget.data.freq}' : '',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.searchListText,
                      )),
                ])),
          ])),
    );
  }
}
