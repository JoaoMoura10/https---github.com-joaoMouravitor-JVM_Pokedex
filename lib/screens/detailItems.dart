import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/ItemScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/detail_items_title.dart';
import 'package:unc_flutter_pokedex/widgets/detail_moves_title.dart';

//tela de detalhes dos itens
class DetailItems extends StatelessWidget {
  const DetailItems({Key? key}) : super(key: key);

  //Criando o esquleto(scaffold) da tela chamando o titulo das itens
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ItemScreenData;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: DetailItemsTitle(id: arguments.id, name: arguments.name),
            ),
          )
        ],
      ),
    );
  }
}