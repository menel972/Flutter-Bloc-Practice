import 'package:http/http.dart' as http;
import 'dart:convert' show json;

import 'package:test_bloc/service/models/pokedex/pokedex_model.dart';
import 'package:test_bloc/service/models/pokedex/results_model.dart';

import '../models/pokemon/pokemon_model.dart';

class PokemonApi {
  // = Urls
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon';
  final String _suffixPkmn = '/';
  final String _suffixLimit = '?limit=';

  // {} Fetch Data
  Future<List<Results>> fetchPokedex(String limit) async {
    final String url = _baseUrl + _suffixLimit + limit;
    final result = await request(url);
    return Pokedex.fromJson(result).results!;
  }
  // fetch all pokemons data

  Future<Pokemon> fetchPokemon(String pkmn) async {
    final String url = _baseUrl + _suffixPkmn + pkmn;
    final result = await request(url);
    return Pokemon.fromJson(result);
  }
  // fetch one pokemon detailed datas

  // {} Request
  Future<Map<String, dynamic>> request(String url) async {
    final result = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = json.decode(result.body);

    return body;
  }
  // api request
}
