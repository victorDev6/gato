
import 'package:flutter/material.dart';

class Jugadores with ChangeNotifier {
   String _player1;
   String _player2;
   String _champion = '';

   String get player1 => _player1;

  set player1(String value) {
    _player1 = value;
  }

   String get player2 => _player2;

  set player2(String value) {
    _player2 = value;
  }

   String get champion => _champion;

  set champion(String value) {
    _champion = value;
    notifyListeners();
  }
}