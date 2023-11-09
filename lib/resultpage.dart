import 'package:flutter/material.dart';
import 'theame.dart';
import 'package:fl_chart/fl_chart.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({this.height = 0, this.weight = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
        backgroundColor: const Color.fromARGB(0, 143, 140, 140),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
      ),
      body: Result(this.height, this.weight),
    );
  }
}

class Result extends StatefulWidget {
  final int height;
  final int weight;

  Result(this.height, this.weight);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(196, 41, 41, 41),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("$headline", style: headlines),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${bmiResult(this.widget.height, this.widget.weight).toStringAsFixed(1)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 36.0)),
                ),
                // Tambahkan grafik di sini
                Expanded(
                  child: BMIChart(bmiResult(this.widget.height, this.widget.weight).toDouble()), // Mengonversi nilai ke double
                ),
                Column(
                  children: <Widget>[
                    Text('Normal BMI range:'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m²", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$comment', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text('RE-CALCULATE', style: primaryButtonStyle),
            ),
          ),
        ),
      ],
    );
  }
}

class BMIChart extends StatelessWidget {
  final double bmiValue;

  BMIChart(this.bmiValue);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: bmiValue / 30.0,
            color: Colors.grey,
            title: 'BMI',
            radius: 80,
            titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          PieChartSectionData(
            value: 1.0 - (bmiValue / 30.0),
            color: const Color.fromARGB(255, 218, 212, 212),
            radius: 70,
          ),
        ],
      ),
    );
  }
}

var comment = '';
var headline = '';
int bmiResult(h, w) {
  double bmi = (w / (h * h)) * 10000;
  
  if (bmi < 18.5) {
    comment = "You are underweight";
    headline = "UNDERWEIGHT";
  } else if (bmi >= 18.5 && bmi < 25) {
    comment = "You are at a healthy weight.";
    headline = "NORMAL";
  } else if (bmi >= 25 && bmi <= 29.99) {
    comment = "You are overweight";
    headline = "OVERWEIGHT";
  } else {
    comment = "You are obese";
    headline = "OBESE";
  }

  return bmi.round();
}
