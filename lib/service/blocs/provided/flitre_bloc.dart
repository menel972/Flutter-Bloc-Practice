import 'dart:async';

import 'package:test_bloc/service/blocs/bloc.dart';

class FilterBloc extends Bloc {
  String filter = '';
  FilterBloc() {
    _sink.add(filter);
  }
  final _streamController = StreamController<String>();

  Sink get _sink => _streamController.sink;
  Stream<String> get stream => _streamController.stream;

  fetchFilter(String filtre) {
    filter = filtre;
    _sink.add(filter);
  }

  @override
  void dispose() => _streamController.close();
}
