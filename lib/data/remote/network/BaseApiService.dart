abstract class BaseApiService {

  final String baseUrl = "https://pokeapi.co/api/v2/";

  Future<dynamic> getResponse(String url);

}