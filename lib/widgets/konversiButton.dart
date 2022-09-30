import 'package:flutter/material.dart';

class konversiButton extends StatelessWidget {
  const konversiButton({super.key, required this.konversi});

  final Function() konversi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      height: 40,
      // convert button
      child: ElevatedButton(
        onPressed: konversi,
        child: Text('Konversi Suhu'),
      ),
    );
  }
}
