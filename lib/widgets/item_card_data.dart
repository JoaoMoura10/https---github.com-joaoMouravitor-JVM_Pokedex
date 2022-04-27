import 'package:flutter/material.dart';

//widget com os dados dos itens utilizados no card
class ItemCardData extends StatelessWidget {
  final int id;
  final String name;

  const ItemCardData({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$name.png')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            child: Text(
              "${name[0].toUpperCase()}${name.substring(1)}",
              style: const TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}