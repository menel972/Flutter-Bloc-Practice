// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/cards/types_card.dart';
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
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No. ${pkmn.id!}'),
                          const SizedBox(width: 30),
                          Text('Espèce : ${pkmn.species!.name!}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Type :'),
                          const SizedBox(width: 10),
                          TypesCard(type: pkmn.types![0].type!.name!),
                          const SizedBox(width: 30),
                          if (pkmn.types!.length > 1)
                            TypesCard(type: pkmn.types![1].type!.name!),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Poids : ${pkmn.weight}'),
                          const SizedBox(width: 30),
                          Text('Taille : ${pkmn.height}0 cm'),
                        ],
                      ),
                    ],
                  ),
                  BlocRouter().pokemonPictures(pokemon: pkmn),
                  Expanded(child: BlocRouter().pokemonStats(pkmn.stats!)),
                ],
              ),
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
