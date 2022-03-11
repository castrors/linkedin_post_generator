import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/color_picker_button.dart';

class ChangeThemeView extends StatelessWidget {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Mudar aparência'),
          TextButton(
            onPressed: () {
              context
                  .read<FormCubit>()
                  .setTheme(const Color(0xFFFF4D50), const Color(0xFF303197));
            },
            child: const ColorPickerButton(
              Color(0xFFFF4D50),
              Color(0xFF303197),
            ),
          ),
          TextButton(
            onPressed: () {
              context
                  .read<FormCubit>()
                  .setTheme(const Color(0xFFFC9F01), const Color(0xFF1C4476));
            },
            child: const ColorPickerButton(
              Color(0xFFFC9F01),
              Color(0xFF1C4476),
            ),
          ),
          TextButton(
            onPressed: () {
              context
                  .read<FormCubit>()
                  .setTheme(const Color(0xFF015BBB), const Color(0xFFFF8049));
            },
            child: const ColorPickerButton(
              Color(0xFF015BBB),
              Color(0xFFFF8049),
            ),
          ),
        ],
      ),
    );
  }
}
