import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/MoveScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/move_card_data.dart';

//widget de cartao dos Movimentos(item da ListView na tela de Movimentos)
class MoveCard extends StatelessWidget {
  final int id;
  final String name;

  const MoveCard({Key? key, required this.id, required this.name})
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
        //acao de clicar e entrar na rota de detalhes de cada movimento, passando os argumentos do Model MoveScreenData
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/detailMoves",
            arguments: MoveScreenData(id, name),
          )
        },
        //container com os dados dos movimentos, chamando do widget MoveCardData
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              MoveCardData(
                id: id,
                name: name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}