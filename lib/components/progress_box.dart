import 'package:flutter/material.dart';
import 'package:vocabyte/app/app_theme.dart';

class ProgressBox extends StatefulWidget {
  const ProgressBox({this.text, super.key});
  final String? text;

  @override
  State<ProgressBox> createState() => _State();
}

class _State extends State<ProgressBox> {
  var isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        height: 150,
        child: Center(
            child: Stack(children: [
          Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.titel4)),
          if (widget.text != null)
            Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(widget.text!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.titel1)))
        ])));
  }
}
