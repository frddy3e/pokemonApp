class ApiEndPoints {
  String getPokemons(int limit, int offset) => "pokemon?limit=$limit&offset=$offset";
  String getPokemon(int id) => "pokemon/$id/";
}