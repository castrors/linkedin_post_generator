import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/change_theme_view.dart';
import 'package:linkedin_post_generator/form/view/download_card.dart';
import 'package:linkedin_post_generator/form/view/download_row.dart';

class ColumnCardDownload extends StatelessWidget {
  ColumnCardDownload({
    Key? key,
  }) : super(key: key);

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DownloadRow(globalKey: _globalKey),
        DownloadCard(globalKey: _globalKey),
        const ChangeThemeView(),
      ],
    );
  }
}
