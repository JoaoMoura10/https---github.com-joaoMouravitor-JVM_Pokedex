import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/TypeModel.dart';
import 'package:unc_flutter_pokedex/widgets/type_grid.dart';

//tela de listagem de tipos
class Types extends StatefulWidget {
  const Types({Key? key}) : super(key: key);

  @override
  State<Types> createState() => _TypesState();
}

class _TypesState extends State<Types> {
  List<Type> type = List.empty();

  //chamando o estado inicial da tela, onde pega os dados da API
  @override
  void initState() {
    super.initState();
    getTypeFromPokeApi();
  }

  //pegando os dados da API e Criando uma Lista com eles em ordem de ID
  void getTypeFromPokeApi() async {
    PokeAPI.getType().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        type = data.asMap().entries.map<Type>((element) {
          element.value['id'] = element.key + 1;
          return Type.fromJson(element.value);
        }).toList();
      });
    });
  }

  //Criando o esquleto(scaffold) da tela chamando o GRID dos elementos de Tipos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipos"),
      ),
      body: TypeGrid(type: type),
    );
  }
}