import 'dart:async';

import 'package:flutter/material.dart';
import 'package:urmparadas/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(
      Duration(seconds: 5),
      (){Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Login()),
        );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff0F2287),
        padding: EdgeInsets.all(60),
        child: Center(
          child: Image.asset("img/logo2.png"),
        ),
        ),
    );
  }
}