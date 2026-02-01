import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPage();
}

class _CurrencyConverterCupertinoPage
    extends State<CurrencyConverterCupertinoPage> {
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

  @override
  Widget build(BuildContext context) {
    // Used this final border to reduce complexity, if we don't used it it increase code length.

    // ignore: non_constant_identifier_names
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.activeGreen,
        middle: Text(
          "Currency Converter",
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: CupertinoColors.activeGreen,
      child: Center(
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
              child: CupertinoTextField(
                //Step-3-----------------|
                controller: textEditingController,

                //Step-3-----------------End|
                keyboardType: TextInputType.number,
                style: TextStyle(color: CupertinoColors.white),

                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
              ),
            ),
            const SizedBox(height: 0),
            CupertinoButton(
              //Step-4-----------------|
              onPressed: convert,
              //Step-4-----------------End|
              color: CupertinoColors.black,
              // style: TextButton.styleFrom(
              //   elevation: (5),
              //   backgroundColor: (CupertinoColors.activeGreen),
              //   foregroundColor: (CupertinoColors.black),
              //   minimumSize: Size(double.infinity, 40),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     side: BorderSide(color: CupertinoColors.black, width: 2),
              //   ),
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
