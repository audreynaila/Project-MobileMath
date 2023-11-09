import 'package:flutter/material.dart';
import 'package:untitled3/home.dart';


class MoneyConverter extends StatefulWidget {
  @override
  _MoneyConverterState createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  late double usdToIdr = 14000.0; // Kurs IDR ke USD
  late double myrToIdr = 3400.0; // Kurs IDR ke MYR
  late double thbToIdr = 300.0; // Kurs IDR ke THB

  TextEditingController rupiahController = TextEditingController();
  TextEditingController usdController = TextEditingController();
  TextEditingController myrController = TextEditingController();
  TextEditingController thbController = TextEditingController();

  void _convertRupiahToUSD() {
    try {
      double rupiah = double.parse(rupiahController.text);
      double usd = rupiah / usdToIdr;
      usdController.text = usd.toStringAsFixed(2);
    } catch (e) {
      usdController.text = 'Invalid Input';
    }
  }

  void _convertRupiahToMYR() {
    try {
      double rupiah = double.parse(rupiahController.text);
      double myr = rupiah / myrToIdr;
      myrController.text = myr.toStringAsFixed(2);
    } catch (e) {
      myrController.text = 'Invalid Input';
    }
  }

  void _convertRupiahToTHB() {
    try {
      double rupiah = double.parse(rupiahController.text);
      double thb = rupiah / thbToIdr;
      thbController.text = thb.toStringAsFixed(2);
    } catch (e) {
      thbController.text = 'Invalid Input';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(35, 32, 31, 31),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(240, 0, 0, 0),
        title: Text("Currency Converter",style: TextStyle(color: const Color.fromARGB(235, 255, 255, 255)),),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back), // Icon kembali ke halaman utama
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(46.40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.monetization_on,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 10,),
            Text(
              "Rupiah Converter",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50,),
            TextField(
              controller: rupiahController,
              style: TextStyle(
                color: Colors.white70,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                prefixText: 'IDR ',
                prefixStyle: TextStyle(color: Colors.white70),
                labelText: 'Rupiah Amount',
                labelStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: _convertRupiahToUSD,
              child: Text("Convert to USD",style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _convertRupiahToMYR,
              child: Text("Convert to MYR",style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: _convertRupiahToTHB,
              child: Text("Convert to THB",style: TextStyle(color: Colors.black),),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: usdController,
              style: TextStyle(
                color: Colors.white70,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              enabled: false,
              decoration: InputDecoration(
                prefixText: 'USD ',
                prefixStyle: TextStyle(color: Colors.white70),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
              ),
            ),
            TextField(
              controller: myrController,
              style: TextStyle(
                color: Colors.white70,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              enabled: false,
              decoration: InputDecoration(
                prefixText: 'MYR ',
                prefixStyle: TextStyle(color: Colors.white70),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
              ),
            ),
            TextField(
              controller: thbController,
              style: TextStyle(
                color: Colors.white70,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              enabled: false,
              decoration: InputDecoration(
                prefixText: 'THB ',
                prefixStyle: TextStyle(color: Colors.white70),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70, width: 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
