import 'package:flutter/material.dart';

//widget com os dados dos tipos utilizados no card
class TypeCardData extends StatelessWidget {
  final int id;
  final String name;
  const TypeCardData({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 50,
            height: 50,
            child: Image(image: AssetImage('assets/img/${id}.png'))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${name[0].toUpperCase()}${name.substring(1)}",
            style: const TextStyle(
              fontSize: 21,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}