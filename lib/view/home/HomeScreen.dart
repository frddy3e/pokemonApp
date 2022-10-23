import 'package:flutter/material.dart';
import 'package:pokemon_app/res/constants/constants.dart';
import 'package:pokemon_app/view/widgets/ChoosePokemon.dart';
import 'package:pokemon_app/view_model/PokemonListVM.dart';
import 'package:provider/provider.dart';

import '../../data/remote/responses/Status.dart';
import '../../models/pokemon.dart';
import '../details/PokemonDetails.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokemonListVM viewModel = PokemonListVM();

  // States
  int _page = 1;
  Pokemon _choosenPokemon = Pokemon();

  ScrollController _controller = ScrollController();
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      //print("scroll vertical hacia abajo");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      //print("scroll vertical hacia arriba");
      _page ++;
      _choosenPokemon = Pokemon();
      viewModel.fetchPokemon(_page);
    }
  }

  @override
  void initState() {
    // To catch scroll events
    _controller.addListener(_scrollListener);

    // To get pokemons list
    viewModel.fetchPokemon(_page);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pokedex")),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            ChangeNotifierProvider<PokemonListVM>(
              create: (BuildContext context) => viewModel,
              child: Consumer<PokemonListVM>(builder: (context, viewModel, _) {
                switch (viewModel.pokemonMain.status) {
                  case Status.LOADING:
                    print("LOADING");
                    return Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    print("ERROR");
                    return Center(child: Text(viewModel.pokemonMain.message ?? "NA"));
                  case Status.COMPLETED:
                    print("COMPLETED");
                    return _getPokemonListView(viewModel.pokemonMain.data?.pokemonList);
                  default:
                }
                return Container();
              }),
            ),

          ],
        ),
      ),
    );
  }

  Widget _getPokemonListView(List<Pokemon>? pokemonList) {
    return Container(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: pokemonList!.asMap().entries.map((entry) {
              int index = entry.key;
              Pokemon pokemon = entry.value;
              return ChoosePokemon(
                  name: pokemon.name ?? "",
                  isChosen: _choosenPokemon.name == pokemon.name,
                  alignment: index == 0 ? AppConstants.leftSide : index == pokemonList.length - 1 ? AppConstants.rightSide : AppConstants.centerSide,
                  onTap: ()=> setState(() => _choosenPokemon = pokemon)
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          PokemonDetails(
            pokemon: _choosenPokemon,
          ),
        ],
      ),
    );
  }

}

