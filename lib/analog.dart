import 'package:flutter/material.dart';
import 'analog_clock.dart'; // Ganti dengan import yang sesuai

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnalogClockScreen(),
    );
  }
}

class AnalogClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(240, 0, 0, 0),
        title: Text('Analog Clock',style: TextStyle(color: Color.fromARGB(255, 247, 237, 237))),
        leading: IconButton(
          color: Colors.white,
          icon: Icon(Icons.arrow_back),
           // Icon kembali (panah)
          onPressed: () {
            // Fungsi ini akan dipanggil ketika tombol kembali ditekan
            Navigator.of(context).pop();
          },
        ),
      ),
      body: AnalogClock(),
    );
  }
}
