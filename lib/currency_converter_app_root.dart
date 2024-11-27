import 'package:flutter/material.dart';

class CurrencyConverterAppRoot extends StatefulWidget {
  const CurrencyConverterAppRoot({super.key});
  @override
  State<CurrencyConverterAppRoot> createState() => _CurrencyConverterAppRoot();
}

class _CurrencyConverterAppRoot extends State<CurrencyConverterAppRoot> {
  int convertedAmount = 0;
  String? sourceCurrency;
  String? destinationCurrency;
  List<String> currencies = <String>[
    "INR",
    "USD",
    "Danish Krone",
    "Rubels",
    "Riyal"
  ];
  final TextEditingController inputValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            convertedAmount.toString(),
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            DropdownButton(
              dropdownColor: Colors.amber,
              hint: const Text("Select source currency"),
              items: currencies.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  enabled: destinationCurrency == value ? false : true,
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: sourceCurrency,
              onChanged: (value) {
                setState(() {
                  sourceCurrency = value;
                });
              },
            ),
            ElevatedButton(
              child: const ImageIcon(AssetImage("lib/assets/exchange.png")),
              onPressed: () {
                setState(() {
                  String? temp = sourceCurrency;
                  sourceCurrency = destinationCurrency;
                  destinationCurrency = temp;
                });
              },
            ),
            DropdownButton(
                dropdownColor: Colors.amber,
                hint: const Text("Select destination currency"),
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    enabled: value == sourceCurrency ? false : true,
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: destinationCurrency,
                onChanged: (value) {
                  setState(() {
                    destinationCurrency = value;
                  });
                }),
          ],
        ),
        TextField(
          controller: inputValueController,
          decoration: const InputDecoration(
              hintText: 'Enter value', focusColor: Colors.cyanAccent),
        ),
        ElevatedButton(
            onPressed: () {
              try {
                double val = double.parse(inputValueController.text);
                setState(() {
                  convertedAmount = val.toInt();
                });
              } catch (e) {
                print(e);
                print("HI");
              }
            },
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: const Size(50, 50)),
            child: const Row(
              children: [
                Icon(Icons.currency_exchange),
                SizedBox(
                  width: 10,
                ),
                Text("Convert")
              ],
            ))
      ],
    ));
  }
}
