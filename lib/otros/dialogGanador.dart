import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gato/screens/game.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DialogGanador {
  DialogWinner(context, winner, Game game) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      barrierLabel: '',
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Container(
                height: 200,
                child: Stack(
                  children: [
                    Center(
                      child: Lottie.asset('assets/winner.json',
                          width: 300, height: 300),
                    ),
                    Center(
                      child: Text(
                        winner.toString(),
                        style: GoogleFonts.arvo(
                            fontSize: 40,
                            color: Color(0xFF990000),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text('Eres el ganador', style: GoogleFonts.arvo(fontSize: 15),),
                      ),
                    ),
                    Positioned(
                      // bottom: 5,
                      right: 5,
                      child: TextButton(
                        onPressed: () {
                          game.reiniciar();
                        },
                        child: Text("Reiniciar"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      pageBuilder: (context, animation1, animation2) {
        return SizedBox();
      },
    );
  }
}
