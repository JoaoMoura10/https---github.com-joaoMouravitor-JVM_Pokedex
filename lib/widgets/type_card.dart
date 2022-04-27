import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/TypeScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/type_card_data.dart';

//widget de cartao dos Tipos(item da ListView na tela de tipos)
class TypeCard extends StatelessWidget {
  final int id;
  final String name;

  const TypeCard({Key? key, required this.id, required this.name})
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
        //acao de clicar e entrar na rota de detalhes de cada tipo, passando os argumentos do Model TypeScreenData
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/detailTypes",
            arguments: TypeScreenData(id, name),
          )
        },
        //container com os dados dos tipos, chamando do widget TypeCardData
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              //TypeCardBackground(id: id),
              TypeCardData(id: id, name: name),
            ],
          ),
        ),
      ),
    );
  }
}