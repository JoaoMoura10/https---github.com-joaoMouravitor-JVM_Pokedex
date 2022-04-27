import 'package:flutter/material.dart';

//widget com os dados dos movimentos utilizados no card
class MoveCardData extends StatelessWidget {
  final int id;
  final String name;

  const MoveCardData({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${id}",
            style: const TextStyle(
                fontSize: 21, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 250,
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