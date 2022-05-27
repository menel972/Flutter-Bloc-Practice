// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/scaffold/appbar_component.dart';
import 'package:test_bloc/components/streams/loading_data.dart';
import 'package:test_bloc/components/streams/no_data.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/bloc_router.dart';
import 'package:test_bloc/service/blocs/provided/pokemon_bloc.dart';
import 'package:test_bloc/service/models/pokemon/pokemon_model.dart';

class PokemonDetailedView extends StatelessWidget {
  const PokemonDetailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<PokemonBloc>(context);

    return StreamBuilder<Pokemon>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final pkmn = snapshot.data!;
          return Scaffold(
            appBar: PreferredSize(
                child: AppbarComponent(title: pkmn.name!),
                preferredSize: const Size(double.infinity, 50)),
            body: Column(
              children: [
                BlocRouter().pokemonPictures(pokemon: pkmn),
                const NoData(),
              ],
            ),
          );
        } else if (!snapshot.hasData) {
          return const NoData();
        } else if (snapshot.hasError) {
          print('detailed view error : ${snapshot.error}');
        }
        return const LoadingData();
      },
    );
  }
}
