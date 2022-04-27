import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/ItemModel.dart';
import 'package:unc_flutter_pokedex/widgets/item_grid.dart';

//tela de listagem de itens
class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List<Item> item = List.empty();

  //chamando o estado inicial da tela, onde pega os dados da API
  @override
  void initState() {
    super.initState();
    getItemFromPokeApi();
  }

  //pegando os dados da API e Criando uma Lista com eles em ordem de ID
  void getItemFromPokeApi() async {
    PokeAPI.getItem().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        item = data.asMap().entries.map<Item>((element) {
          element.value['id'] = element.key + 1;
          return Item.fromJson(element.value);
        }).toList();
      });
    });
  }

  //Criando o esquleto(scaffold) da tela chamando o GRID dos elementos de itens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Itens"),
      ),
      body: ItemGrid(item: item),
    );
  }
}