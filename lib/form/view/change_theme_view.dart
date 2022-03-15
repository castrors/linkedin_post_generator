import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/theme_button.dart';

class ChangeThemeView extends StatelessWidget {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text('Mudar aparência'),
          ThemeButton(
            topColor: Color(0xFFFF4D50),
            bottomColor: Color(0xFF303197),
          ),
          ThemeButton(
            topColor: Color(0xFFFC9F01),
            bottomColor: Color(0xFF1C4476),
          ),
          ThemeButton(
            topColor: Color(0xFF015BBB),
            bottomColor: Color(0xFFFF8049),
          ),
        ],
      ),
    );
  }
}
