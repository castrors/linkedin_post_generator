import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class ColumnInputFieldsView extends StatelessWidget {
  const ColumnInputFieldsView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('Crie o seu post para LinkedIn sem custo.'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Escreva o seu nome *'),
              onChanged: (name) {
                context.read<FormCubit>().setName(name);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Cargo ou área que gostaria de trabalhar? *'),
              onChanged: (jobDescription) {
                context.read<FormCubit>().setJobDescription(jobDescription);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Qual o seu melhor e-mail de contato? *'),
              onChanged: (email) {
                context.read<FormCubit>().setEmail(email);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Escreva uma mensagem *'),
              onChanged: (message) {
                context.read<FormCubit>().setMessage(message);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
