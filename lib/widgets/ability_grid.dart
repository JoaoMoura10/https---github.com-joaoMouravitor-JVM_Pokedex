import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/AbilityModel.dart';
import 'package:unc_flutter_pokedex/widgets/ability_card.dart';

//widget de GRID dos elementos na tela de Listagem
class AbilityGrid extends StatefulWidget {
  final List<Ability> ability;
  const AbilityGrid({Key? key, required this.ability}) : super(key: key);

  @override
  State<AbilityGrid> createState() => _AbilityGridState();
}

class _AbilityGridState extends State<AbilityGrid> {
  @override
  Widget build(BuildContext context) {
    //dispoe dos itens em uma View em forma de Lista, pegando os dados desses itens pelo Widget AbilityCard
    return ListView(
      children: widget.ability
          .map(
            (ability) => Padding(
              padding: const EdgeInsets.all(2),
              child: AbilityCard(id: ability.id, name: ability.name),
            ),
          )
          .toList(),
    );
  }
}