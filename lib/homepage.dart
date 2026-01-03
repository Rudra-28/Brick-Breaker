import 'dart:async';
import 'package:brickbreaker/ball.dart';
import 'package:brickbreaker/coverscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ballx = 0.0; // Remove 'final'
  double bally = 0.0;
  Timer? _timer; // Store timer reference
  bool hasGameStarted = false;
  double playerWidth = 0.3;

  void startGame() {
    setState(() {
      hasGameStarted = true;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        bally -= 0.02; // Slower for visibility
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Prevent leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        body: Center(
          child: Stack(
            children: [
              CoverScreen(hasGameStarted: hasGameStarted),
              Align(
                alignment: Alignment(0, -0.2),
                child: Container(
                  child: Text(
                    "Tap to Play",
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              MyBall(ballx: ballx, bally: bally),

              Container(
                alignment: Alignment(0, 0.9),
                height: 20,
                width: MediaQuery.of(context).size.width * playerWidth / 2,
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
