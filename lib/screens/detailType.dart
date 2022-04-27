import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/TypeScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/detail_type-title.dart';

//tela de detalhes dos tipos
class DetailTypes extends StatelessWidget {
  const DetailTypes({Key? key}) : super(key: key);

  //Criando o esquleto(scaffold) da tela chamando o titulo dos tipos
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as TypeScreenData;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: DetailTypesTitle(id: arguments.id, name: arguments.name),
            ),
          )
        ],
      ),
    );
  }
}