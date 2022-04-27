import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/ItemModel.dart';
import 'package:unc_flutter_pokedex/widgets/item_card.dart';

//widget de GRID dos elementos na tela de Listagem
class ItemGrid extends StatefulWidget {
  final List<Item> item;
  const ItemGrid({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  @override
  Widget build(BuildContext context) {
    //dispoe dos itens em uma View em forma de Lista, pegando os dados desses itens pelo Widget ItemCard
    return ListView(
      children: widget.item
          .map(
            (item) => Padding(
              padding: const EdgeInsets.all(2),
              child: ItemCard(id: item.id, name: item.name),
            ),
          )
          .toList(),
    );
  }
}