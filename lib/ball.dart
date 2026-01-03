import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  
  const MyBall({super.key, required this.ballx, required this.bally});
final double ballx;
  final double bally;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballx, bally),
      height: 15,
      width: 15,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.purple,
      ),
    );
  }
}
