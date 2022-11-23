import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Xylophone'),
          backgroundColor: Color(0xFF0B7268),
        ),
        body: xylophone(),
      ),
    );
  }
}

class xylophone extends StatefulWidget {
  const xylophone({Key? key}) : super(key: key);

  @override
  State<xylophone> createState() => _xylophoneState();
}

class _xylophoneState extends State<xylophone> {
  final player = AudioPlayer();

  Expanded playButton(int noteNo, Color backColor,String text){
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          player.play(AssetSource('note$noteNo.wav'));
        },
        style: ButtonStyle(
          backgroundColor : MaterialStateProperty.all<Color>(backColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        child: Text('$text'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          playButton(1, Color(0xFF80DEEA),'NOTE 1'),
          playButton(2, Color(0xFF4DD0E1),'NOTE 2'),
          playButton(3, Color(0xFF26C6DA),'NOTE 3'),
          playButton(4, Color(0xFF00BCD4),'NOTE 4'),
          playButton(5, Color(0xFF00ACC1),'NOTE 5'),
          playButton(6, Color(0xFF00838F),'NOTE 6'),
          playButton(7, Color(0xFF006064),'NOTE 7'),
        ],
      ),
    );
  }
}
