import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/TypeModel.dart';
import 'package:unc_flutter_pokedex/widgets/type_card.dart';

//widget de GRID dos elementos na tela de Listagem
class TypeGrid extends StatefulWidget {
  final List<Type> type;
  const TypeGrid({Key? key, required this.type}) : super(key: key);

  @override
  State<TypeGrid> createState() => _TypeGridState();
}

class _TypeGridState extends State<TypeGrid> {
  @override
  Widget build(BuildContext context) {
    //dispoe dos itens em uma View em forma de Lista, pegando os dados desses itens pelo Widget TypeCard
    return ListView(
      children: widget.type
          .map(
            (type) => Padding(
              padding: const EdgeInsets.all(2),
              child: TypeCard(id: type.id, name: type.name),
            ),
          )
          .toList(),
    );
  }
}