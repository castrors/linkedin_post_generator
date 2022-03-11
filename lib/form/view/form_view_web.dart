import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/column_card_download.dart';
import 'package:linkedin_post_generator/form/view/column_input_fields_view.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class FormViewWeb extends StatelessWidget {
  const FormViewWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar:
          AppBar(title: const Text('Crie o seu post para LinkedIn sem custo')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: Center(
                child: ColumnInputFieldsView(),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: ColumnCardDownload(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
