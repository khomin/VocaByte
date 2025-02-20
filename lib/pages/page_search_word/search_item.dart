import 'package:flutter/material.dart';
import 'package:vocabyte/components/hover_click.dart';
import 'package:vocabyte/pages/models/search_word_model.dart';
import 'package:vocabyte/pages/models/word_data.dart';
import 'package:vocabyte/pages/settings/theme/app_theme.dart';

class SearchWordItem extends StatefulWidget {
  const SearchWordItem({required this.data, this.onClicked, super.key});
  final SearchInfo data;
  final Function? onClicked;

  @override
  State<SearchWordItem> createState() => _State();
}

class _State extends State<SearchWordItem> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Meaning? meaning;
    if (widget.data.meaning.isNotEmpty) {
      meaning = widget.data.meaning[0];
    }
    return HoverClick(
        onHover: (hover) {
          setState(() {
            isHover = hover;
          });
        },
        onPressedL: (_) {
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
                    // word, synonyms
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          const Spacer(),
                          Text(widget.data.word,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.text3)),
                          if (meaning != null && meaning.synonyms.isNotEmpty)
                            Text(meaning.synonyms.join(' '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.text5)),
                          const Spacer()
                        ])),
                    //
                    // in study
                    if (widget.data.isInStudy)
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.school_outlined,
                              size: 20,
                              color: Theme.of(context).colorScheme.text5)),
                    //
                    // populariry
                    Text(widget.data.freq >= 0 ? '${widget.data.freq}' : '',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.searchListText,
                        )),
                    const SizedBox(width: 15)
                  ]))
            ])));
  }
}
