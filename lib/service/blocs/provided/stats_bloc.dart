// ignore_for_file: avoid_print

import 'dart:async';

import 'package:test_bloc/service/blocs/bloc.dart';
import 'package:test_bloc/service/models/pokemon/stats_model.dart';

class StatsBloc extends Bloc {
  StatsBloc(List<Stats> stats) {
    throwPokemon(stats);
  }

  final _streamController = StreamController<List<Stats>>();

  Sink get _sink => _streamController.sink;
  Stream<List<Stats>> get stream => _streamController.stream;

  throwPokemon(List<Stats> stats) {
    _sink.add(stats);
  }

  @override
  void dispose() => _streamController.close();
}
