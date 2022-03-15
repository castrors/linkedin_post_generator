import 'package:flutter/material.dart';
import 'package:linkedin_post_generator/utils/screen_size.dart';

class OutputField extends StatelessWidget {
  const OutputField({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Padding(
        padding: EdgeInsets.all(isMobile(context) ? 8 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile(context) ? 13 : 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              width: 220,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
