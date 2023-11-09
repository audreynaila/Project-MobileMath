import 'package:flutter/material.dart';
import 'home.dart';
import 'regScreen.dart'; // Pastikan untuk mengimpor regScreen.dart
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';

class AnimatedCheckmark extends StatefulWidget {
  @override
  _AnimatedCheckmarkState createState() => _AnimatedCheckmarkState();
}

class _AnimatedCheckmarkState extends State<AnimatedCheckmark> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(100, 100),
        painter: CheckmarkPainter(_animation.value),
      ),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  final double progress;

  CheckmarkPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final double x = size.width * 0.25;
    final double y = size.height * 0.5;
    final double checkLength = min(size.width, size.height) * 0.4;

    final Path path = Path();
    path.moveTo(x, y);
    path.lineTo(x + checkLength * progress, y + checkLength * progress);
    path.lineTo(x + checkLength * 1.5 * progress, y - checkLength * 0.5 * progress);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LoginScreen extends StatelessWidget {
  void _signInButtonPressed(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      animType: AnimType.SCALE,
      title: 'Sign In Berhasil',
      desc: 'Selamat datang Pada Aplikasi!',
      btnOkOnPress: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      btnOkColor: Colors.black,
    )..show();
  }

  void _createAccountButtonPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/math.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Hello\nSign in!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(184, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(184, 0, 0, 0),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Color(0xFF7B61FF),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        gradient: const LinearGradient(
                          colors: [Color.fromARGB(227, 16, 12, 2), Color.fromARGB(255, 11, 9, 3)],
                        ),
                      ),
                      child: TextButton(
                      onPressed: () {
                        _signInButtonPressed(context);
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                    ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _createAccountButtonPressed(context);
                        },
                        child: Text("Create New Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFF7B61FF),
                            )),
                      ),
                    ],
                  ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
