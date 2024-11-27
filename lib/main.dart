import 'package:currency_converter/currency_converter_app_root.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//const prevents re-renders/rebuilds of that element
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // initialRoute: "root",
        home: CurrencyConverterAppRoot());
  }
}
