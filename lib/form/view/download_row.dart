import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/utils/file_utils.dart';

class DownloadRow extends StatelessWidget {
  const DownloadRow({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey globalKey;

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
          ElevatedButton(
            child: const Text('Baixar'),
            onPressed: () async {
              final pngBytes = await captureBytesFromWidget(globalKey);
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
    );
  }
}
