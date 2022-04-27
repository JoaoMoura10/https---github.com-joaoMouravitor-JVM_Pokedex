import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/PokeModel.dart';
import 'package:unc_flutter_pokedex/widgets/pokemon_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemon = List.empty();

  get title => null;

  @override
  void initState() {
    super.initState();
    getPokemonFromPokeApi();
  }

  void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.network(''),
              accountName: Text('Pokedex'),
               accountEmail: Text(''),
               ),
               
               ListTile(
                 title: Text('Tipos'),
                 onTap: (){
                  Navigator.pop(context);
                Navigator.pushNamed(context, "/types");
                 },
               ),
               
               ListTile(
                 title: Text('Habilidades'),
                 onTap: (){
                  Navigator.pop(context);
                Navigator.pushNamed(context, "/abilities");
                 },
               ),

               ListTile(
                 title: Text('Movimentos'),
                 onTap: (){
                  Navigator.pop(context);
                Navigator.pushNamed(context, "/moves");
                 },
               ),

               ListTile(
                 title: Text('Itens'),
                 onTap: (){
                  Navigator.pop(context);
                Navigator.pushNamed(context, "/items");
                 },
               )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Pokedex"),
      ),
      body: PokemonGrid(pokemon: pokemon),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Share',
        child: const Icon(
          Icons.share_rounded,
        ),
      ),
    );
  }
}
