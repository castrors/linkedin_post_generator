import 'package:flutter/material.dart';

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({required this.topColor, required this.bottomColor});

  final Color topColor;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 14,
          width: 28,
          color: topColor,
        ),
        Container(
          height: 14,
          width: 28,
          color: bottomColor,
        ),
      ],
    );
  }
}
