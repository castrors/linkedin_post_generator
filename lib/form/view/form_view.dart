import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/color_picker_button.dart';
import 'package:linkedin_post_generator/form/view/output_field.dart';
import 'package:linkedin_post_generator/form/view/subtitle_text.dart';
import 'package:linkedin_post_generator/form/view/title_text.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
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
                decoration:
                    InputDecoration(labelText: 'Escreva uma mensagem *'),
                onChanged: (message) {
                  context.read<FormCubit>().setMessage(message);
                },
              ),

              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seu post vai ficar assim: ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

              // context.watch<FormCubit>().state.toString(),
              RepaintBoundary(
                key: _globalKey,
                child: Card(
                  color: context.watch<FormCubit>().state.topColor,
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 42.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TitleText(
                                      'Quer me\ncontratar?',
                                    ),
                                    SubtitleText(
                                      context
                                              .watch<FormCubit>()
                                              .state
                                              .message
                                              .isEmpty
                                          ? '“Escreva uma mensagem pessoal ao lado para tornar o seu post único.”'
                                          : '“${context.watch<FormCubit>().state.message}”',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 9,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 28),
                                color: context
                                    .watch<FormCubit>()
                                    .state
                                    .bottomColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      color: Colors.blue,
                                      child: Row(
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
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Colors.red,
                                        child: OutputField(
                                          title: 'Vamos conversar? ',
                                          value: context
                                              .watch<FormCubit>()
                                              .state
                                              .email,
                                        ),
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
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text('Mudar aparência'),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FormCubit>()
                          .setTheme(Color(0xFFFF4D50), Color(0xFF303197));
                    },
                    child: ColorPickerButton(
                      Color(0xFFFF4D50),
                      Color(0xFF303197),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FormCubit>()
                          .setTheme(Color(0xFFFC9F01), Color(0xFF1C4476));
                    },
                    child: ColorPickerButton(
                      Color(0xFFFC9F01),
                      Color(0xFF1C4476),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FormCubit>()
                          .setTheme(Color(0xFF015BBB), Color(0xFFFF8049));
                    },
                    child: ColorPickerButton(
                      Color(0xFF015BBB),
                      Color(0xFFFF8049),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
