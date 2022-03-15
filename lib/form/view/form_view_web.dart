import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/column_card_download.dart';
import 'package:linkedin_post_generator/form/view/column_input_fields_view.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class FormViewWeb extends StatelessWidget {
  FormViewWeb({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xFFF8F8F8),
                padding: const EdgeInsets.symmetric(horizontal: 66),
                child: Center(
                  child: ColumnInputFieldsView(
                    formKey: formKey,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: ColumnCardDownload(
                    formKey: formKey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
