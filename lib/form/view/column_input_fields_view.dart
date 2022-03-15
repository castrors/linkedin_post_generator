import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/input_field.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';

class ColumnInputFieldsView extends StatelessWidget {
  ColumnInputFieldsView({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Crie o seu post para LinkedIn ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      height: 1.2,
                      letterSpacing: -2,
                      color: Color(0xFF303197),
                    ),
                  ),
                  TextSpan(
                    text: 'sem custo.',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      height: 1.2,
                      letterSpacing: -2,
                      color: Color(0xFFFF4D50),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 58,
            ),
            // Text('Crie o seu post para LinkedIn sem custo.'),
            InputField(
              title: 'Escreva o seu nome ',
              onChanged: (name) {
                context.read<FormCubit>().setName(name);
              },
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'Por favor, preencha o seu nome.';
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InputField(
              title: 'Cargo ou área que gostaria de trabalhar? ',
              onChanged: (jobDescription) {
                context.read<FormCubit>().setJobDescription(jobDescription);
              },
              validator: (jobDescription) {
                if (jobDescription == null || jobDescription.isEmpty) {
                  return 'Por favor, preencha o seu cargo ou área.';
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InputField(
              title: 'Qual o seu melhor e-mail de contato? ',
              onChanged: (email) {
                context.read<FormCubit>().setEmail(email);
              },
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return 'Por favor, preencha o seu email.';
                }
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InputField(
              title: 'Escreva uma mensagem ',
              onChanged: (message) {
                context.read<FormCubit>().setMessage(message);
              },
              validator: (message) {
                if (message == null || message.isEmpty) {
                  return 'Por favor, preencha a sua mensagem.';
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
