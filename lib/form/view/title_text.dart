import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/utils/screen_size.dart';

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
      style: TextStyle(
        fontSize: isMobile(context) ? 46 : 70,
        fontWeight: FontWeight.bold,
        height: 0.88,
        color: Colors.white,
      ),
    );
  }
}
