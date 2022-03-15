import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/utils/file_utils.dart';

class DownloadRow extends StatelessWidget {
  const DownloadRow({
    Key? key,
    required this.globalKey,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey globalKey;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Seu post vai ficar assim: ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 240,
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(
                    color: Color(0xFF939393),
                  ),
                ),
              ),
            ),
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final pngBytes = await captureBytesFromWidget(globalKey);
                await FileSaver.instance.saveFile(
                  'LinkedIn Post Image',
                  pngBytes,
                  'png',
                  mimeType: MimeType.PNG,
                );
              }
            },
            child: const Text(
              'Baixar',
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF939393),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
