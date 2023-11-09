import 'package:flutter/material.dart';
import 'package:untitled3/WelcomeScreen.dart';
import 'package:untitled3/analog.dart';
import 'package:untitled3/analog_clock.dart';
import 'package:untitled3/bmipage.dart';
import 'package:untitled3/calculator.dart';
import 'package:untitled3/money.dart';
import 'package:untitled3/splashscreen.dart';
import 'package:untitled3/todo.dart';
import 'profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'todo.dart';

void showLogoutDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    animType: AnimType.SCALE,
    title: 'Logout',
    desc: 'Apakah Anda Yakin Ingin Logout?',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    },
    btnOkColor: Colors.black, // Atur warna tombol OK menjadi hitam
    btnCancelColor: const Color.fromARGB(255, 0, 0, 0), // Atur warna tombol Cancel menjadi putih
  )..show();
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedApp = 'Profile'; // Inisialisasi pilihan pertama

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 14, 15),
        title: const Text(
          "Home Page",
          style: TextStyle(color: Color.fromARGB(235, 250, 252, 255)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout, // Icon logout
              color: Colors.white,
            ),
            onPressed: () {
              showLogoutDialog(context); // Panggil fungsi showLogoutDialog saat tombol logout ditekan
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: selectedApp, // Nilai yang dipilih
            onChanged: (String? newValue) {
              setState(() {
                selectedApp = newValue!; // Mengupdate nilai yang dipilih
                // Handle navigasi berdasarkan pilihan yang dipilih di sini
                if (selectedApp == 'Profile') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                } else if (selectedApp == 'Calculator') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorApp()));
                } else if (selectedApp == 'BMI Calculator') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BmiPage()));
                }else if (selectedApp == 'Analog Clock'){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => AnalogClockScreen())));
                }else if (selectedApp == 'Money Converter'){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => MoneyConverter())));
                }else if (selectedApp == 'To Do-List'){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => TodoApp())));
                }
              });
            },
            items: <String>['Profile', 'Calculator', 'BMI Calculator', 'Analog Clock', 'Money Converter', 'To Do-List'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(25),
              crossAxisCount: 2,
              children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.account_circle, size: 70, color: Color.fromARGB(247, 20, 18, 18),),
                    Text("Profile", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorApp()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calculate, size: 70, color: Color.fromARGB(255, 0, 0, 0),),
                    Text("Calculator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BmiPage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.monitor_weight_rounded, size: 70, color: Color.fromARGB(241, 24, 25, 26),),
                    Text("BMI Calculator", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AnalogClockScreen()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.access_time_filled, size: 70, color: Color.fromARGB(241, 24, 25, 26),),
                    Text("Analog Clock", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MoneyConverter()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.monetization_on_sharp, size: 70, color: Color.fromARGB(241, 24, 25, 26),),
                    Text("Money Converter", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
            Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TodoApp()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.calendar_today_rounded, size: 70, color: Color.fromARGB(241, 24, 25, 26),),
                    Text("To Do-List", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        
    )
    ]
    
        
      
      )
    );
  }
}