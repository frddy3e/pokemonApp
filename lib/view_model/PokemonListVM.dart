
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/repository/PokemonRepositoryImplementation.dart';

import '../data/remote/responses/ApiResponse.dart';

class PokemonListVM extends ChangeNotifier{
  final _myRepo = PokemonReposotoryImplementation();

  ApiResponse<PokemonList> pokemonMain = ApiResponse.loading();

  void _setPokemonMain(ApiResponse<PokemonList> response) {
    pokemonMain = response;
    notifyListeners();
  }

  Future<void> fetchPokemon(int page) async {
    _setPokemonMain(ApiResponse.loading());
    _myRepo
        .getPokemonList(page)
        .then((value) => _setPokemonMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setPokemonMain(ApiResponse.error(error.toString())));
  }
}