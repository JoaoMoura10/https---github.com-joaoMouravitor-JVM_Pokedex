import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/MoveModel.dart';
import 'package:unc_flutter_pokedex/widgets/move_grid.dart';

//tela de listagem de movimentos
class Moves extends StatefulWidget {
  const Moves({Key? key}) : super(key: key);

  @override
  State<Moves> createState() => _MovesState();
}

class _MovesState extends State<Moves> {
  List<Move> move = List.empty();

  //chamando o estado inicial da tela, onde pega os dados da API
  @override
  void initState() {
    super.initState();
    getMoveFromPokeApi();
  }

  //pegando os dados da API e Criando uma Lista com eles em ordem de ID
  void getMoveFromPokeApi() async {
    PokeAPI.getMove().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        move = data.asMap().entries.map<Move>((element) {
          element.value['id'] = element.key + 1;
          return Move.fromJson(element.value);
        }).toList();
      });
    });
  }

//Criando o esquleto(scaffold) da tela chamando o GRID dos elementos de Movimentos 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimentos"),
      ),
      body: MoveGrid(move: move),
    );
  }
}