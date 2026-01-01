import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {

 final bool hasGameStarted;

  const CoverScreen({super.key, required this.hasGameStarted});



  @override
  Widget build(BuildContext context) {


return hasGameStarted ? Container(): Container(
  alignment: Alignment(0, -0.2),
  child: Text("Tap to Play",style: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),));
  }
}