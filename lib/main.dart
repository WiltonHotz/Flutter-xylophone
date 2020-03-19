import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:async';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int number) {
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Expanded buildKey({int soundNumber, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(soundNumber);
        },
        color: color,
      ),
    );
  }
  void playTimedSound() {

    int count = 0;
    var song =  [];
    song.add(5);
    song.add(5);
    song.add(3);
    song.add(6);
    song.add(5);
    song.add(3);

    Timer.periodic(new Duration(seconds: 1), (timer) {
      playSound(song[count]);
      count++;
      if(count == 6)
      timer.cancel();
    });
  }

  Expanded buildSongKey({String title, Color color}) {
    return Expanded(
      child: FlatButton(
        child: Text(title),
        onPressed: () {
          playTimedSound();
        },
        color: color,
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              buildSongKey(title: 'PLAY MY SOUNDTRACK', color: Colors.blueGrey),
              buildKey(soundNumber: 1, color: Colors.red),
              buildKey(soundNumber: 2, color: Colors.orange),
              buildKey(soundNumber: 3, color: Colors.yellowAccent),
              buildKey(soundNumber: 4, color: Colors.green),
              buildKey(soundNumber: 5, color: Colors.teal),
              buildKey(soundNumber: 6, color: Colors.blue),
              buildKey(soundNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}