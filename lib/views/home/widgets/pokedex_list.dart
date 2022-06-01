// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/streams/loading_data.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/bloc_router.dart';
import 'package:test_bloc/service/blocs/provided/pokedex_bloc.dart';
import 'package:test_bloc/service/models/pokedex/results_model.dart';

class PokedexList extends StatelessWidget {
  const PokedexList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<PokedexBloc>(context);

    return StreamBuilder<List<Results>>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Results> _pokedex = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (val) => {
                      _bloc.fetchPokedex(val),
                    },
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: _pokedex.length,
                    padding: const EdgeInsets.all(10),
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      final Results pokemon = _pokedex[i];

                      return BlocRouter().pokemonCard(name: pokemon.name!);
                    },
                  ),
                ),
              ],
            );
          } else if (!snapshot.hasData) {
            return const LoadingData();
          } else if (snapshot.hasError) {
            print('Pokedex list error : ${snapshot.error}');
          }
          return const LoadingData();
        });
  }
}
