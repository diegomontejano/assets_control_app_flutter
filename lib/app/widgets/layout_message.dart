import 'package:flutter/material.dart';

class LayoutMessage extends StatelessWidget {
  const LayoutMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Center(
          child: Text(
            "Please, use this app on a screen larger than 1350px",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
