import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/form/view/form_view_mobile.dart';
import 'package:linkedin_post_generator/form/view/form_view_web.dart';
import 'package:linkedin_post_generator/utils/screen_size.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? FormViewMobile(
            formKey: _formKey,
          )
        : FormViewWeb(
            formKey: _formKey,
          );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
