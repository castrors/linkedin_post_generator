import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/color_picker_button.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({required this.topColor, required this.bottomColor});

  final Color topColor;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context
            .read<FormCubit>()
            .setTheme(topColor: topColor, bottomColor: bottomColor);
      },
      child: ColorPickerButton(
        topColor: topColor,
        bottomColor: bottomColor,
      ),
    );
  }
}
