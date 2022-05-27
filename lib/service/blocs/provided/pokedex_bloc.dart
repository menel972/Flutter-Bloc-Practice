// ignore_for_file: avoid_print

import 'dart:async';

import 'package:test_bloc/service/API/pokemon_api.dart';
import 'package:test_bloc/service/models/pokedex/results_model.dart';

import '../bloc.dart';

class PokedexBloc extends Bloc {
  PokedexBloc(String filter) {
    fetchPokedex(filter);
  }

  final _streamController = StreamController<List<Results>>();
  Sink get _sink => _streamController.sink;
  Stream<List<Results>> get stream => _streamController.stream;

  fetchPokedex(String filter, {String limit = '1126'}) async {
    final List<Results> pokedex = await PokemonApi().fetchPokedex(limit);

    final List<Results> filteredPokedex =
        pokedex.where((pokemon) => pokemon.name!.startsWith(filter)).toList();

    _sink.add(filteredPokedex);
  }

  @override
  void dispose() => _streamController.close();
}
