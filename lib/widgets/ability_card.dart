import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/AbilityScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/ability_card_data.dart';

//widget de cartao das habilidades(item da ListView na tela de Habilidades)
class AbilityCard extends StatelessWidget {
  final int id;
  final String name;

  const AbilityCard({Key? key, required this.id, required this.name})
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
        //acao de clicar e entrar na rota de detalhes de cada habilidade
        onTap: () => {
          Navigator.pushNamed(
            context,
            "/detailAbilities",
            arguments: AbilityScreenData(id, name),
          )
        },
        //container com os dados das habilidades, chamando do widget AbilityCardData e passando os atributos
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              AbilityCardData(id: id, name: name),
            ],
          ),
        ),
      ),
    );
  }
}