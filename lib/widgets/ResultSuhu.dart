import 'package:flutter/material.dart';

class ResultSuhu extends StatelessWidget {
  const ResultSuhu({
    super.key,
    required this.result,
  });

  final double result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Text(
            'Hasil',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Text(
          '$result',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
