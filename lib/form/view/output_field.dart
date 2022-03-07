import 'package:flutter/material.dart';

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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.white,
                width: 220,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        fontWeight: FontWeight.w700),
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
