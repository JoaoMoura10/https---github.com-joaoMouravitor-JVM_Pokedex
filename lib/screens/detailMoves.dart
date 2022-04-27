import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/MoveScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/detail_moves_title.dart';

//tela de detalhes dos movimentos
class DetailMoves extends StatelessWidget {
  const DetailMoves({Key? key}) : super(key: key);

  //Criando o esquleto(scaffold) da tela chamando o titulo dos movimentos
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as MoveScreenData;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: DetailMovesTitle(id: arguments.id, name: arguments.name),
            ),
          )
        ],
      ),
    );
  }
}