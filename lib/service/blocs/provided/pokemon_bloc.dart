// ignore_for_file: avoid_print

import 'dart:async';

import 'package:test_bloc/service/API/pokemon_api.dart';
import 'package:test_bloc/service/blocs/bloc.dart';
import 'package:test_bloc/service/models/pokemon/pokemon_model.dart';

class PokemonBloc extends Bloc {
  PokemonBloc(String pkmn) {
    fetchPokemon(pkmn);
  }

  final _streamController = StreamController<Pokemon>();

  Sink get _sink => _streamController.sink;
  Stream<Pokemon> get stream => _streamController.stream;

  fetchPokemon(String pkmn) async {
    final Pokemon pokemon = await PokemonApi().fetchPokemon(pkmn);
    _sink.add(pokemon);
  }

  @override
  void dispose() => _streamController.close();
}
