import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      color: Colors.white,
      border: Border(
        right: BorderSide(
          color: Colors.green,
          width: 3,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        left: BorderSide(
          color: Colors.green,
          width: 3,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        right: BorderSide(
          color: Colors.green,
          width: 3,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      // borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        left: BorderSide(
          color: Colors.green,
          width: 3,
        ),
        bottom: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        right: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        top: BorderSide(
          color: Colors.green,
          width: 3,
        ),
      ),
    ),
    BoxDecoration(
      //borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border(
        left: BorderSide(
          color: Colors.green,
          width: 3,
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
        body: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Selector<Jugadores, bool>(
            selector: (_, first) => first.first,
            builder: (context, first, __) => first
                ? Text(
                    "Turno del jugador: " + context.read<Jugadores>().player1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  )
                : Text(
                    "Turno del jugador: " + context.read<Jugadores>().player2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
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
                            ? const Text("X")
                            : const Text("O")),
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
      ],
    ));
  }
}
