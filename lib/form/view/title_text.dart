import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.bold,
        height: 0.88,
        color: Colors.white,
      ),
    );
  }
}
