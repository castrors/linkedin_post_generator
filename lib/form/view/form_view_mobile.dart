import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/column_card_download.dart';
import 'package:linkedin_post_generator/form/view/column_input_fields_view.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class FormViewMobile extends StatelessWidget {
  const FormViewMobile({Key? key}) : super(key: key);

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
              const ColumnInputFieldsView(),
              const SizedBox(
                height: 16,
              ),
              ColumnCardDownload()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
