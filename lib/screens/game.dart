import 'package:gato/otros/dialogGanador.dart';
import 'package:gato/otros/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gato/otros/fondo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:gato/providers/jugadores.dart';

class Game extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey0 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey3 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey4 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey5 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey6 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey7 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey8 = GlobalKey<FlipCardState>();
  List<int> cruz = [];
  List<int> circulo = [];
  late List<GlobalKey<FlipCardState>> flips;

  /*
     0   1   2
     3   4   5
     6   7   8
   */

  List<List<int>> combinaciones = [
    [0, 1, 2],
    [0, 3, 6],
    [6, 7, 8],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
    [3, 4, 5],
    [1, 4, 7]
  ];

  List<BoxDecoration> cards = [
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        right: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        left: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        right: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        left: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
        bottom: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        right: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      border: Border(
        left: BorderSide(
          color: Color(0xFF990000),
          width: 5,
        ),
      ),
    )
  ];

  BuildContext context;
  Game(BuildContext this.context);

  reiniciar() {
    cruz.clear();
    circulo.clear();
    Navigator.of(context)
        .pop();
    flips.forEach((element) {
      if (element.currentState
          ?.isFront ==
          false) {
        element.currentState
            ?.toggleCard();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    flips = [
      cardKey0,
      cardKey1,
      cardKey2,
      cardKey3,
      cardKey4,
      cardKey5,
      cardKey6,
      cardKey7,
      cardKey8,
    ];

    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 30),
                    child: ListTile(
                      title: Selector<Jugadores, bool>(
                        selector: (_, first) => first.first,
                        builder: (context, first, __) => first
                            ? Text(
                                "Turno de: " +
                                    context.read<Jugadores>().player1,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tomorrow(
                                    fontSize: 30,
                                    color: Color(0xFF990000),
                                    fontWeight: FontWeight.w500),
                              )
                            : Text(
                                "Turno de: " +
                                    context.read<Jugadores>().player2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tomorrow(
                                    fontSize: 30,
                                    color: Color(0xFF990000),
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (flips[index].currentState?.isFront ??
                                    true) {
                                  flips[index].currentState?.toggleCard();
                                  if (context.read<Jugadores>().first) {
                                    cruz.add(index);
                                  } else {
                                    circulo.add(index);
                                  }
                                  print(cruz);
                                  int winCruz = 0;
                                  bool winCru = false;
                                  int winCirculo = 0;
                                  bool winCir = false;
                                  for (var x in combinaciones) {
                                    for (var y in x) {
                                      if (cruz.contains(y)) {
                                        winCruz = winCruz + 1;
                                      }
                                      if (circulo.contains(y)) {
                                        winCirculo = winCirculo + 1;
                                      }
                                    }
                                    if (winCruz >= 3) {
                                      winCru = true;
                                      print(cruz);
                                    }
                                    if (winCirculo >= 3) {
                                      print(circulo);
                                      winCir = true;
                                    }
                                    winCruz = 0;
                                    winCirculo = 0;
                                  }

                                  if (winCru) {
                                    DialogGanador().DialogWinner(context, context.read<Jugadores>().player1, this);
                                  }
                                  if (winCir) {
                                    DialogGanador().DialogWinner(context, context.read<Jugadores>().player2, this);
                                  }

                                  context.read<Jugadores>().first =
                                      !context.read<Jugadores>().first;
                                }
                              },
                              child: Container(
                                child: FlipCard(
                                  key: flips[index],
                                  front: const SizedBox(),
                                  back: Center(
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Selector<Jugadores, bool>(
                                              selector: (_, t) => t.first,
                                              builder: (_, t, __) => cruz
                                                      .contains(index)
                                                  ? Text("X",
                                                      style: GoogleFonts
                                                          .balooDa(
                                                              fontSize: 50,
                                                              color: Colors
                                                                  .red))
                                                  : Text(
                                                      "O",
                                                      style: GoogleFonts
                                                          .balooDa(
                                                              fontSize: 50,
                                                              color: Colors
                                                                  .redAccent))),
                                        ),

                                        /*Center(
                                          child: Container(
                                            height:15.0,
                                            color: Colors.black,),
                                        ),
                                        Center(
                                          child: Container(
                                            width:15.0,
                                            color: Colors.black,),
                                        ),
                                        CustomPaint(
                                          painter: MyPainter(),
                                        ),
                                        CustomPaint(
                                          painter: MyPainter2(),
                                        )*/
                                      ],
                                    ),
                                  ),
                                  onFlip: () {},
                                  flipOnTouch: false,
                                ),
                                decoration: cards[index],
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            );
                          },
                          itemCount: 9,
                        ),

                        /*Container(
                          height: 15.0,
                          color: Colors.black,
                        ),
                        Container(
                          height: 15.0,
                          color: Colors.black,
                        ),
                        Container(
                          height: 15.0,
                          color: Colors.black,
                        ),
                        Positioned(
                          left: 50,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.48,
                            width: 15.0,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.48,
                            width: 15.0,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          right: 50,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.48,
                            width: 15.0,
                            color: Colors.black,
                          ),
                        ),
                        CustomPaint(
                          painter: MyPainter(),
                        ),
                        CustomPaint(
                          painter: MyPainter2(),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Regresar",
                              style: GoogleFonts.arvo(
                                  fontSize: 20,
                                  color: Color(0xFF990000),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            cruz.clear();
                            circulo.clear();
                            flips.forEach((element) {
                              if (element.currentState?.isFront == false) {
                                element.currentState?.toggleCard();
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Reiniciar",
                              style: GoogleFonts.arvo(
                                  fontSize: 20,
                                  color: Color(0xFF990000),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 0);
    final p2 = Offset(120, 120);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 15;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 120);
    final p2 = Offset(120, 0);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 15;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
