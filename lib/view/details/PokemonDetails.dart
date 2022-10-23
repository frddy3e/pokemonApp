
import 'package:flutter/material.dart';
import 'package:pokemon_app/res/styles/styles.dart';
import 'package:pokemon_app/view_model/PokemonVM.dart';
import 'package:provider/provider.dart';

import '../../data/remote/responses/Status.dart';
import '../../models/pokemon.dart';
import '../skills/SkillsDetails.dart';

class PokemonDetails extends StatefulWidget {
  Pokemon? pokemon;
  PokemonDetails({Key? key, this.pokemon}) : super(key: key);

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {

  final PokemonVM viewModel = PokemonVM();

  void getPokemon(){
    String? url = widget.pokemon!.url?? "/0/0/";
    url = url.substring(0, url.length - 1);
    int pokemonId = int.parse(url.split("/").last);
    viewModel.fetchPokemon(pokemonId);
  }

  @override
  void initState() {
    getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getPokemon();
    return Expanded(
      child: widget.pokemon?.name == null ?
      noPokemonSelected():
      Column(
        children: [
          SkillsDetails(
            pokemon: widget.pokemon!,
              skills: widget.pokemon!.skills?? []
          ),
          ChangeNotifierProvider<PokemonVM>(
            create: (context) => viewModel,
            child: Consumer<PokemonVM>(
              builder: (context, model, child) {
                switch (viewModel.pokemonMain.status) {
                  case Status.LOADING:
                    print("LOADING");
                    return Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    print("ERROR");
                    return Center(child: Text(viewModel.pokemonMain.message ?? "NA"));
                  case Status.COMPLETED:
                    print("COMPLETED");
                    return pokemonView(viewModel.pokemonMain.data);
                  default:
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget pokemonView(Pokemon? pokemon) {
    print("pokemonView: ${pokemon?.toJson()}");
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            pokemon?.name ?? "NA",
            style: pokemonSemiBold.copyWith(fontSize: 20),
          ),
          // show pokemon image
          Image.network(
            pokemon?.imageUrl ?? "",
            height: 250,
            width: 250,
            fit: BoxFit.fill,
          ),
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