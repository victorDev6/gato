import 'package:flutter/material.dart';
import 'package:gato/screens/firstPlayer.dart';
import 'package:google_fonts/google_fonts.dart';

class Empecemos extends StatefulWidget {
  @override
  _EmpecemosState createState() => _EmpecemosState();
}

class _EmpecemosState extends State<Empecemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('GATO', style: GoogleFonts.asset(fontSize: 40)),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: Image.asset('assets/logo.png'),
             ),
             OutlinedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstPlayer()),
                   );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Comencemos", style: GoogleFonts.arvo(fontSize: 30),),
                ),
             )
          ],
       ),
    );
  }
}
