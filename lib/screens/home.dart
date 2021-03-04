import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gato/otros/fondo.dart';
import 'package:gato/providers/jugadores.dart';
import 'package:gato/screens/firstPlayer.dart';
import 'package:gato/screens/game.dart';
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
      body: CustomPaint(
        painter: BluePainter(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: OutlinedButton(
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
                          style: GoogleFonts.arvo(
                              fontSize: 30,
                              color: Color(0xFF990000),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Game()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Iniciar juego",
                        style: GoogleFonts.arvo(
                            fontSize: 30,
                            color: Color(0xFF990000),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  'assets/logo.png',
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
