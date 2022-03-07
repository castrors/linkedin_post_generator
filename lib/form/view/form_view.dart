import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/output_field.dart';
import 'package:linkedin_post_generator/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkedin_post_generator/utils.dart';

class FormView extends StatelessWidget {
  FormView({Key? key}) : super(key: key);

  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text('Crie o seu post para LinkedIn sem custo')),
      body: Form(
        child: Column(
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

            // context.watch<FormCubit>().state.toString(),
            RepaintBoundary(
              key: _globalKey,
              child: Card(
                color: Color(0xFF303197),
                child: Column(
                  children: [
                    Container(
                      height: 600,
                      width: 600,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 11,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 42.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Quer me\ncontratar?',
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        height: 0.88,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    context
                                            .watch<FormCubit>()
                                            .state
                                            .message
                                            .isEmpty
                                        ? '“Escreva uma mensagem pessoal ao lado para tornar o seu post único.”'
                                        : context
                                            .watch<FormCubit>()
                                            .state
                                            .message,
                                    style: TextStyle(
                                        fontSize: 24,
                                        height: 1.4,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 28),
                              color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      OutputField(
                                        title: 'Eu me chamo: ',
                                        value: context
                                            .watch<FormCubit>()
                                            .state
                                            .name,
                                      ),
                                      OutputField(
                                        title: 'Quero trabalhar como: ',
                                        value: context
                                            .watch<FormCubit>()
                                            .state
                                            .jobDescription,
                                      )
                                    ],
                                  ),
                                  Center(
                                    child: OutputField(
                                      title: 'Vamos conversar? ',
                                      value: context
                                          .watch<FormCubit>()
                                          .state
                                          .email,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Baixar'),
              onPressed: () async {
                final pngBytes = await Utils.capture(_globalKey);
                await FileSaver.instance.saveFile(
                  'LinkedIn Post Image',
                  pngBytes,
                  'png',
                  mimeType: MimeType.PNG,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
