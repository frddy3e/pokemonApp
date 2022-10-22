

import 'package:pokemon_app/data/remote/network/ApiEndPoints.dart';
import 'package:pokemon_app/data/remote/network/BaseApiService.dart';
import 'package:pokemon_app/data/remote/network/NetworkApiService.dart';
import 'package:pokemon_app/models/pokemon.dart';
import 'package:pokemon_app/res/constants/constants.dart';

import 'PokemonRepository.dart';

class PokemonReposotoryImplementation implements PokemonRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<PokemonList?> getPokemonList(int page) async {
    try {
      const itemsPerPage = AppConstants.itemsPerPage;
      int limit = itemsPerPage;
      int offset = itemsPerPage * (page - 1);

      dynamic response = await _apiService.getResponse(ApiEndPoints().getPokemons(limit, offset));
      final jsonData = PokemonList.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Pokemon?> getPokemon(int id) async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().getPokemon(id));
      final jsonData = Pokemon.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}