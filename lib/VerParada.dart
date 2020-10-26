import 'package:flutter/material.dart';

class VerParada extends StatefulWidget {
  @override
  _VerParadaState createState() => _VerParadaState();
}

class _VerParadaState extends State<VerParada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0F2287),
        title: Image.asset("img/logo3.png", width: 98, height: 22,),
        centerTitle: true,
      ),
      body: Container(

      ),
    );
  }
}