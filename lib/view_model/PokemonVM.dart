
import 'package:flutter/material.dart';

import '../data/remote/responses/ApiResponse.dart';
import '../models/pokemon.dart';
import '../repository/PokemonRepositoryImplementation.dart';

class PokemonVM extends ChangeNotifier{
  final _myRepo = PokemonReposotoryImplementation();

  ApiResponse<Pokemon> pokemonMain = ApiResponse.loading();

  void _setPokemonMain(ApiResponse<Pokemon> response) {
    pokemonMain = response;
    notifyListeners();
  }

  Future<void> fetchPokemon(int id) async {
    _setPokemonMain(ApiResponse.loading());
    _myRepo
        .getPokemon(id)
        .then((value) => _setPokemonMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setPokemonMain(ApiResponse.error(error.toString())));
  }


}