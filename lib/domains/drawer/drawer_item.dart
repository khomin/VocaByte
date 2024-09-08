import 'package:vocabyte/components/hover_click_component.dart';
import 'package:vocabyte/domains/drawer/drawer_menu.dart';
import 'package:vocabyte/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vocabyte/domains/models/app_model.dart';

class MenuMainData {
  MenuMainData(
      {required this.name,
      required this.comment,
      required this.icon,
      required this.pageType});
  String name = '';
  String comment = '';
  IconData icon;
  MenuPageType pageType;
}

class MenuMainItem extends StatefulWidget {
  const MenuMainItem(
      {required this.itemData, required this.onChanged, super.key});
  final MenuMainData itemData;
  final Function(MenuPageType)? onChanged;
  @override
  State<MenuMainItem> createState() => _State();
}

class _State extends State<MenuMainItem> {
  var _hover = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HoverClickComponent(onClick: () {
      widget.onChanged?.call(widget.itemData.pageType);
    }, onHover: (hover) {
      setState(() {
        _hover = hover;
      });
    }, child: Builder(builder: (context) {
      var model = context.watch<AppModel>();
      return Container(
          height: 50,
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: (_hover || widget.itemData.pageType == model.page)
                ? Theme.of(context).colorScheme.menuIdle
                : Theme.of(context).colorScheme.menuActive,
          ),
          child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Row(children: [
                Container(
                  margin: const EdgeInsets.only(right: 11),
                  width: 23,
                  height: 23,
                  child: Icon(widget.itemData.icon,
                      color: (widget.itemData.pageType == model.page)
                          ? Theme.of(context).colorScheme.menuIdleText
                          : Theme.of(context).colorScheme.menuActiveText),
                ),
                Expanded(
                    child: Text(widget.itemData.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: (widget.itemData.pageType == model.page)
                              ? Theme.of(context).colorScheme.menuIdleText
                              : Theme.of(context).colorScheme.menuActiveText,
                        )))
              ])));
    }));
  }
}
