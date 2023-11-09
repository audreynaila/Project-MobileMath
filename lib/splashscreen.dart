import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled3/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                './assets/math.jpeg',
                fit: BoxFit.cover, // Untuk mengisi seluruh ruang yang tersedia
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
