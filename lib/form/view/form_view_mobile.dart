import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/column_card_download.dart';
import 'package:linkedin_post_generator/form/view/column_input_fields_view.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class FormViewMobile extends StatelessWidget {
  const FormViewMobile({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text('Crie o seu post para LinkedIn sem custo')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              ColumnInputFieldsView(
                formKey: formKey,
              ),
              const SizedBox(
                height: 16,
              ),
              ColumnCardDownload(
                formKey: formKey,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
