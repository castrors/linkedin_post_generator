import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.subtitle, {Key? key}) : super(key: key);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
          fontSize: 24,
          height: 1.4,
          fontWeight: FontWeight.w400,
          color: Colors.white),
    );
  }
}
