import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/MoveModel.dart';
import 'package:unc_flutter_pokedex/widgets/move_card.dart';

//widget de GRID dos elementos na tela de Listagem
class MoveGrid extends StatefulWidget {
  final List<Move> move;
  const MoveGrid({Key? key, required this.move}) : super(key: key);

  @override
  State<MoveGrid> createState() => _MoveGridState();
}

class _MoveGridState extends State<MoveGrid> {
  @override
  Widget build(BuildContext context) {
    //dispoe dos itens em uma View em forma de Lista, pegando os dados desses itens pelo Widget MoveCard
    return ListView(
      children: widget.move
          .map(
            (move) => Padding(
              padding: const EdgeInsets.all(2),
              child: MoveCard(id: move.id, name: move.name),
            ),
          )
          .toList(),
    );
  }
}