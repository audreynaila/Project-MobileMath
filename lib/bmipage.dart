import 'package:flutter/material.dart';
import 'package:untitled3/hextoint.dart';
import 'theame.dart';
import 'resultpage.dart';

class BmiPage extends StatefulWidget {

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {


  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;

  ageIncrement(){
    setState(() {
     age++; 
    });
  }

  ageDecrement(){
    setState(() {
     age--; 
    });
  }

  weightIncrement(){
    setState(() {
     weight++; 
    });
  }

  weightDecrement(){
    setState(() {
     weight--; 
    });
  }

 
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.black54, // Ganti dengan warna latar belakang yang sesuai
    appBar: AppBar(
      title: Text("BMI Calculator"),
      backgroundColor: Colors.transparent,
      elevation: 0, // Hapus bayangan di bawah AppBar
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios), // Ikon "back" di sini
        onPressed: () {
          Navigator.of(context).pop(); // Ini akan mengarahkan kembali ke halaman sebelumnya
        },
      ),
    ),
        body: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(131, 96, 95, 95)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Image.asset('assets/male.png',height: 100.0,width: 100.0,),
                       SizedBox(
                           height: 20.0,
                        ),
                       Text('MALE',style: headlines)
                     ],
                      ),
                   
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(131, 96, 95, 95)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/female.png',height: 100.0,width: 100.0,),
                        SizedBox(
                           height: 20.0,
                        ),
                        Text('FEMALE',style: headlines)
                      ],
                    ),
                  ),
                )
              ],
            ),

            Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(131, 96, 95, 95)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                
                        Text('HEIGHT',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$height", style: boldNumber),
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: minHeight,
                          max: maxHeight,
                          activeColor: Colors.grey,
                          inactiveColor: Colors.black,
                          onChanged: ( double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          semanticFormatterCallback: (double newValue) {
                            return '$newValue.round()';
                          }
                    )
                      ],
                    ),
                  ),
            ),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(131, 96, 95, 95)
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    
                        Text('WEIGHT',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$weight", style: boldNumber),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: weightDecrement,
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey
                                ),
                                child: Center(
                                  child: Text("-", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            ),

                             Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white70
                              ),
                              child: InkWell(
                                  onTap: weightIncrement,
                                  child: Center(
                                    child: Text("+", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(131, 96, 95, 95)
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    
                        Text('AGE',style: headlines),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$age",style: boldNumber),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: ageDecrement,
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white70
                                ),
                                child: Center(
                                  child: Text("-", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            ),

                             Container(
                              height: 40.0,
                              width: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.grey
                              ),
                              child: InkWell(
                                  onTap: ageIncrement,
                                  child: Center(
                                    child: Text("+", style: secondaryButtonColorStyle,),
                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),

            
            
             InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
                  child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10.0),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Center(
                    child: Text('CALCULATE BMI', style: primaryButtonStyle),
                    ),
               ),
             ),
          

            ],
        ),
  
      )
    );
  }
}
