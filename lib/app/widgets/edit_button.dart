import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  // attributes
  final IconData icons;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  // constructor
  const EditButton({
    required this.icons,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor, // backgroundColor attribute
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          child: Icon(
            icons, // icons attribute
            color: iconColor, // iconColor attribute
          ),
          onTap: onTap, // onTap attribute
        ),
      ),
    );
  }
}
