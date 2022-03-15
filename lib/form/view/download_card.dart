import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:linkedin_post_generator/form/cubit/form_cubit.dart';
import 'package:linkedin_post_generator/form/view/output_field.dart';
import 'package:linkedin_post_generator/form/view/subtitle_text.dart';
import 'package:linkedin_post_generator/form/view/title_text.dart';

class DownloadCard extends StatelessWidget {
  const DownloadCard({
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: Card(
        color: context.watch<FormCubit>().state.topColor,
        child: Column(
          children: [
            SizedBox(
              height: 600,
              width: 600,
              child: Column(
                children: [
                  Expanded(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 42),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TitleText(
                            'Quer me\ncontratar?',
                          ),
                          SubtitleText(
                            context.watch<FormCubit>().state.message.isEmpty
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
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      color: context.watch<FormCubit>().state.bottomColor,
                      child: StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: [
                          OutputField(
                            title: 'Eu me chamo: ',
                            value: context.watch<FormCubit>().state.name,
                          ),
                          OutputField(
                            title: 'Quero trabalhar como: ',
                            value:
                                context.watch<FormCubit>().state.jobDescription,
                          ),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 1,
                            child: OutputField(
                              title: 'Vamos conversar? ',
                              value: context.watch<FormCubit>().state.email,
                            ),
                          ),
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
    );
  }
}
