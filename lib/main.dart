import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text('Magic Ball'),
        ),
        body: const MagicBallPage(),
      ),
    );
  }
}

class MagicBallPage extends StatefulWidget {
  const MagicBallPage({Key? key}) : super(key: key);

  @override
  State<MagicBallPage> createState() => _MagicBallPageState();
}

class _MagicBallPageState extends State<MagicBallPage> {
  int stateValue = 1;

  void ballState() {
    setState(() {
      stateValue = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                ballState();
                final player = AudioCache();
                player.play('note5.wav');
              },
              child: Image.asset('images/ball$stateValue.png'),
            ),
          )
        ],
      ),
    );
  }
}
