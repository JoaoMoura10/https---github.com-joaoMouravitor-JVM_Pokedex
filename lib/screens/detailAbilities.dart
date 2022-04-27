import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/AbilityScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/detail_abilities_title.dart';

//tela de detalhes das habilidades
class DetailAbilities extends StatelessWidget {
  const DetailAbilities({Key? key}) : super(key: key);

  //Criando o esquleto(scaffold) da tela chamando o titulo das habilidades
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as AbilityScreenData;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  DetailAbilitiesTitle(id: arguments.id, name: arguments.name),
            ),
          )
        ],
      ),
    );
  }
}