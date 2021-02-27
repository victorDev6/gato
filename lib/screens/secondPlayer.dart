import 'package:flutter/material.dart';
import 'package:gato/providers/jugadores.dart';
import 'package:gato/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondPlayer extends StatefulWidget {
  @override
  _SecondPlayerState createState() => _SecondPlayerState();
}

class _SecondPlayerState extends State<SecondPlayer> {
  final TextEditingController _player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Jugador 2',
            style: GoogleFonts.raviPrakash(fontSize: 68),
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _player2Controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'alias del jugador 2'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Center(
              child: OutlinedButton(
                onPressed: () {
                  if (_player2Controller.text.isNotEmpty) {
                    Provider.of<Jugadores>(context, listen: false).player2 =
                        _player2Controller.text;
                  } else {
                    Provider.of<Jugadores>(context, listen: false).player2 =
                    'Jugador 2';
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Continuar", style: GoogleFonts.arvo(fontSize: 30),),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
