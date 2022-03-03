import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
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
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'shape.svg',
                          semanticsLabel: 'background shape',
                        ),
                        Positioned(
                          left: 40,
                          top: 32,
                          right: 80,
                          child: Text(
                            'Quer me contratar?',
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 210,
                          right: 60,
                          child: Text(
                            context.watch<FormCubit>().state.message,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 360,
                          left: 40,
                          child: Text(
                            'Eu me chamo:',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          left: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.white,
                              width: 220,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  context.watch<FormCubit>().state.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 360,
                          left: 340,
                          child: Text(
                            'Quero trabalhar como:',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          left: 340,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.white,
                              width: 220,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  context
                                      .watch<FormCubit>()
                                      .state
                                      .jobDescription,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      backgroundColor: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 470,
                          left: 40,
                          child: Text(
                            'Vamos conversar?',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          top: 500,
                          left: 40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: Colors.white,
                              width: 520,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  context.watch<FormCubit>().state.email,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    backgroundColor: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
