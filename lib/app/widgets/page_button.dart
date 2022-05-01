import 'package:flutter/material.dart';
import 'custom_design.dart';

class PageButton extends StatelessWidget {
  // attributes
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? color;
  final bool? alignToEnd;

  // constructor
  const PageButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.color,
    this.alignToEnd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: alignToEnd == true // alignToEnd attribute
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.center,
            children: [
              Text(
                title, // title attribute
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color:
                      color ?? CustomDesign.secondaryColor4, // color attribute
                ),
              ),
              Text(
                subtitle, // subtitle attribute
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color:
                      color ?? CustomDesign.secondaryColor4, // color attribute
                ),
              ),
            ],
          ),
          onTap: onTap, // onTap attribute
        ),
      ),
    );
  }
}
