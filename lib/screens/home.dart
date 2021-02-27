import 'package:flutter/material.dart';
import 'package:gato/providers/jugadores.dart';
import 'package:gato/screens/firstPlayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Jugadores>(context, listen: false).player1);
    print(Provider.of<Jugadores>(context, listen: false).player2);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  aqui el codigo del juego

            OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPlayer()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cambiar alias",
                  style: GoogleFonts.arvo(fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
