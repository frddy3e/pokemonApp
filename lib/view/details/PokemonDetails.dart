
import 'package:flutter/material.dart';
import 'package:pokemon_app/res/styles/styles.dart';

import '../../models/pokemon.dart';
import '../../res/colors/colors.dart';
import '../../res/dimensions/dimensions.dart';
import '../skills/SkillsDetails.dart';

class PokemonDetails extends StatefulWidget {
  Pokemon? pokemon;
  PokemonDetails({Key? key, this.pokemon}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.pokemon?.name == null ?
      noPokemonSelected():
      Column(
        children: [
          SkillsDetails(skills: widget.pokemon!.skills?? []),
        ],
      ),
    );
  }

  Widget noPokemonSelected() {
    return Center(
      child: Text(
          "Porfavor selecciona un pokemon",
        style: pokemonRegular.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}