import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/models/PokemonScreenData.dart';
import 'package:unc_flutter_pokedex/widgets/detail_button.dart';
import 'package:unc_flutter_pokedex/widgets/detail_data.dart';
import 'package:unc_flutter_pokedex/widgets/detail_image.dart';
import 'package:unc_flutter_pokedex/widgets/detail_title.dart';


class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as PokemonScreenData;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DetailImage(image: arguments.image),
            DetailTitle(id: arguments.id, name: arguments.name),
            DetailData(),
          ],
        ),
      ),
      floatingActionButton: const DetailBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}