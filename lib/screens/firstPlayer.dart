import 'package:flutter/material.dart';
import 'package:gato/otros/fondo.dart';
import 'package:gato/providers/jugadores.dart';
import 'package:gato/screens/secondPlayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstPlayer extends StatefulWidget {
  @override
  _FirstPlayerState createState() => _FirstPlayerState();
}

class _FirstPlayerState extends State<FirstPlayer> {
  final TextEditingController _player1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Jugador 1',
              style: GoogleFonts.raviPrakash(fontSize: 68, color: Color(0xFF990000)),
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _player1Controller,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'alias del jugador 1'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (_player1Controller.text.isNotEmpty) {
                      Provider.of<Jugadores>(context, listen: false).player1 =
                          _player1Controller.text;
                    } else {
                      Provider.of<Jugadores>(context, listen: false).player1 = 'Jugador 1';
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPlayer()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Continuar", style: GoogleFonts.arvo(fontSize: 30, color: Color(0xFF990000), fontWeight: FontWeight.w700),),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

