//-----------------------------------------------|
// This file is used to handle all widget stuff.

//1. We create a seperate file for handle material page.
//2. MaterialApp used to create all alignments and directiona and etc stuff.
//3. Scaffold is used to give header, footer and body and etc.
//4. Body: Text("Hello World")-> Problem with is that text is at header, mean top corner of our page.
// so to solve this we have to used center property of flutter.
// Experiment 1-> return Text("Hello, World!!!", textDirection: TextDirection.rtl);

//-----------------------------------------------|

//Working
//1. Store variable.
//2. Convert to INR.
//3. Store that new value to variable
//4. Display

//-----------------------------------------------|

import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  //Step-1-----------------|
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    //Step-2-----------------|
    result = double.parse(textEditingController.text) * 85.38;
    setState(() {});
    //Step-2-----------------End|
  }
  //Step-1-----------------End|

  //Dispose Text Editor
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Used this final border to reduce complexity, if we don't used it it increase code length.

    // ignore: non_constant_identifier_names
    final Border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 3,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              //Step-0-----------------|
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',

              //Step-0-----------------End|
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                //Step-3-----------------|
                controller: textEditingController,

                //Step-3-----------------End|
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(color: Colors.white70, fontSize: 13),
                  prefixIcon: Icon(Icons.monetization_on),
                  prefixIconColor: Colors.white,
                  fillColor: const Color.fromARGB(255, 0, 0, 0),
                  filled: true,
                  focusedBorder: Border,
                  enabledBorder: Border,
                ),
              ),
            ),
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  //Step-4-----------------|
                  convert();
                  //Step-4-----------------End|
                },
                style: TextButton.styleFrom(
                  elevation: (5),
                  backgroundColor: (Colors.green),
                  foregroundColor: (Colors.black),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
