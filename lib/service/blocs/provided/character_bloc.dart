// // ignore_for_file: avoid_print

// import 'dart:async';

// import 'package:test_bloc/service/API/marvel_api.dart';
// import 'package:test_bloc/service/models/results_model.dart';

// import '../bloc.dart';

// class CharacterBloc extends Bloc {
//   CharacterBloc() {
//     fetchCharacters('');
//   }
//   // = StreamController
//   final _streamController = StreamController<List<Results>>();

//   // = Sink
//   Sink<List<Results>> get _sink => _streamController.sink;

//   // = Stream
//   Stream<List<Results>> get stream => _streamController.stream;

//   // {} Logic
//   fetchCharacters(String startWith) async {
//     final List<Results> characters =
//         await MarvelApi().fetchCharacters(startWith);
//     _sink.add(characters);
//   }

//   editFilter(String filter) {
//     fetchCharacters(filter);
//   }

//   @override
//   void dispose() => _streamController.close();
// }
