import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/AbilityModel.dart';
import 'package:unc_flutter_pokedex/widgets/ability_grid.dart';

//tela de listagem de habilidades
class Abilities extends StatefulWidget {
  const Abilities({Key? key}) : super(key: key);

  @override
  State<Abilities> createState() => _AbilitiesState();
}

class _AbilitiesState extends State<Abilities> {
  List<Ability> ability = List.empty();

  //chamando o estado inicial da tela, onde pega os dados da API
  @override
  void initState() {
    super.initState();
    getAbilityFromPokeApi();
  }

  //pegando os dados da API e Criando uma Lista com eles em ordem de ID
  void getAbilityFromPokeApi() async {
    PokeAPI.getAbility().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        ability = data.asMap().entries.map<Ability>((element) {
          element.value['id'] = element.key + 1;
          return Ability.fromJson(element.value);
        }).toList();
      });
    });
  }

  //Criando o esquleto(scaffold) da tela chamando o GRID dos elementos de habilidades
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habilidades"),
      ),
      body: AbilityGrid(ability: ability),
    );
  }
}