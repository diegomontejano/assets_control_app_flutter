import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class CustomTextList extends StatelessWidget {
  // attributes
  final String text;
  final bool title;

  // constructor
  const CustomTextList({
    required this.text,
    this.title = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: title == false
          ? const EdgeInsets.all(10)
          : const EdgeInsets.fromLTRB(10, 10, 10, 6),
      child: AutoSizeText(
        text, // text attribute
        maxLines: 2,
        minFontSize: 12,
        softWrap: true,
        textAlign: TextAlign.center,
        style: title == false // title attribute
            ? const TextStyle(fontSize: 15)
            : const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
