import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(String soundPath) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundPath.wav'),);
  }

  Expanded buildKey({required Color color, required String soundNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text('Playing sound $soundNumber'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: '1'),
              buildKey(color: Colors.orange, soundNumber: '2'),
              buildKey(color: Colors.yellow, soundNumber: '3'),
              buildKey(color: Colors.green, soundNumber: '4'),
              buildKey(color: Colors.teal, soundNumber: '5'),
              buildKey(color: Colors.blue, soundNumber: '6'),
              buildKey(color: Colors.purple, soundNumber: '7'),
            ],
          ),
        ),
      ),
    );
  }
}