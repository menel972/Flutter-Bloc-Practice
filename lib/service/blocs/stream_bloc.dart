import 'dart:async';

import 'package:test_bloc/service/blocs/bloc.dart';

class StreamBloc extends Bloc {
  StreamBloc(Stream s) {
    _sink.add(s);
  }

  final _streamController = StreamController<Stream>();
  Sink get _sink => _streamController.sink;
  Stream<Stream> get stream => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
