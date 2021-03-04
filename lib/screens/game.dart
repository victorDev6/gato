import 'package:flip_card/flip_card.dart';
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

  @override
  Widget build(BuildContext context) {
    List<GlobalKey<FlipCardState>> flips = [
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
                                "Turno de: " + context.read<Jugadores>().player1,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tomorrow(fontSize: 30, color: Color(0xFF990000), fontWeight: FontWeight.w500),
                              )
                            : Text(
                                "Turno de: " + context.read<Jugadores>().player2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.tomorrow(fontSize: 30, color: Color(0xFF990000), fontWeight: FontWeight.w500),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (flips[index].currentState?.isFront ?? true) {
                              flips[index].currentState.toggleCard();
                              if (context.read<Jugadores>().first) {
                                cruz.add(index);
                              } else {
                                circulo.add(index);
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
                                child: Selector<Jugadores, bool>(
                                    selector: (_, t) => t.first,
                                    builder: (_, t, __) => cruz.contains(index)
                                        ? Text("X", style: GoogleFonts.balooDa(fontSize: 50, color: Colors.red))
                                        : Text("O", style: GoogleFonts.balooDa(fontSize: 50, color: Colors.redAccent))),
                              ),
                              onFlip: () {},
                              flipOnTouch: false,
                            ),
                            decoration: cards[index],
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        );
                      },
                      itemCount: 9,
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
                            child: Text("Regresar", style: GoogleFonts.arvo(fontSize: 20, color: Color(0xFF990000), fontWeight: FontWeight.w700),),
                          ),
                        ),
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            cruz = null;
                            circulo = null;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Reiniciar", style: GoogleFonts.arvo(fontSize: 20, color: Color(0xFF990000), fontWeight: FontWeight.w700),),
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
