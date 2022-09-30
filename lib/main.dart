import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_temperature_converter/widgets/ResultSuhu.dart';
import 'package:flutter_temperature_converter/widgets/inputSuhu.dart';
import 'package:flutter_temperature_converter/widgets/konversiButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();

  double input = 0;
  // double kelvin = 0;
  // double reamur = 0;
  // double fahrenheit = 0;

  String selected = "Kelvin";

  double _result = 0;

  var listSuhu = ["Kelvin", "Reamur", "Fahrenheit"];

  List<String> listHasil = [];

  // konversi() {
  //   // set state
  //   setState(() {
  //     input = double.parse(etInput.text);
  //     kelvin = input + 273;
  //     reamur = 4 / 5 * input;
  //     fahrenheit = (9 / 5 * input) + 32;
  //   });
  // }

  konversi() {
    // set state
    setState(() {
      print(listHasil.length);
      input = double.parse(etInput.text);
      switch (selected) {
        case "Kelvin":
          {
            _result = input + 273;
            listHasil.add("Konversi dari : " +
                "$input" +
                " ke " +
                "$_result" +
                " Kelvin");
          }
          break;

        case "Reamur":
          {
            _result = 4 / 5 * input;
            listHasil.add("Konversi dari : " +
                "$input" +
                " ke " +
                "$_result" +
                " Reamur");
          }
          break;

        case "Fahrenheit":
          {
            _result = (9 / 5 * input) + 32;
            listHasil.add("Konversi dari : " +
                "$input" +
                " ke " +
                "$_result" +
                " Fahrenheit");
          }
          break;
      }
    });
  }

  _onDropdownChanged(value) {
    setState(() {
      selected = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputSuhu(etInput: etInput),
              DropdownButton(
                items: listSuhu.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: selected,
                onChanged: _onDropdownChanged,
                isExpanded: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResultSuhu(
                    result: _result,
                  ),
                ],
              ),
              konversiButton(
                konversi: konversi,
              ),
              Expanded(
                child: ListView(
                  children: listHasil.map((String value) {
                    return Container(
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
