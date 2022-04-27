import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/ItemScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/item_card_data.dart';

//widget de cartao dos Itens(item da ListView na tela de itens)
class ItemCard extends StatelessWidget {
  final int id;
  final String name;

  const ItemCard({Key? key, required this.id, required this.name})
      : super(key: key);

  //decoracao da borda do widget
  BoxDecoration getContainerDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withOpacity(0.24), width: 1),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        enableFeedback: true,
        splashColor: Colors.red[50],
        //acao de clicar e entrar na rota de detalhes de cada item, passando os argumentos do Model ItemScreenData
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/detailItems",
            arguments: ItemScreenData(id, name),
          )
        },
        //container com os dados dos itens, chamando do widget ItemCardData
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              ItemCardData(id: id, name: name),
            ],
          ),
        ),
      ),
    );
  }
}