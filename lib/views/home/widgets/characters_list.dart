// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:test_bloc/components/streams/loading_data.dart';
// import 'package:test_bloc/components/streams/no_data.dart';
// import 'package:test_bloc/service/blocs/bloc_provider.dart';
// import 'package:test_bloc/service/blocs/provided/character_bloc.dart';
// import 'package:test_bloc/service/models/results_model.dart';

// class CharacterList extends StatelessWidget {
//   const CharacterList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _bloc = BlocProvider.of<CharacterBloc>(context);
//     return StreamBuilder<List<Results>>(
//         stream: _bloc.stream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const NoData();
//           } else if (snapshot.hasData) {
//             final characters = snapshot.data!;
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: TextFormField(
//                     onChanged: (value) => _bloc.editFilter(value),
//                     decoration: const InputDecoration(
//                       labelText: 'Filtre',
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: characters.length,
//                     itemBuilder: (context, i) {
//                       final character = characters[i];
//                       return ListTile(
//                         leading: CircleAvatar(
//                           child: Image.network(character.thumbnail!.path!),
//                         ),
//                         title: Text('${i + 1} - ${character.name!}'),
//                         subtitle: Text(
//                           character.description!,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           } else if (snapshot.hasError) {
//             print('fetch list error : ${snapshot.error}');
//           }
//           return const LoadingData();
//         });
//   }
// }
