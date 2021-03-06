import 'package:flutter/material.dart';
import 'package:gato/providers/jugadores.dart';
import 'package:gato/screens/empecemos.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Jugadores()),
      ],
      child: MaterialApp(
        title: 'Gato',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Empecemos(),
      ),
    );
  }
}
