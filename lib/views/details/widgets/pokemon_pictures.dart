// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/streams/loading_data.dart';
import 'package:test_bloc/components/streams/no_data.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/models/pokemon/pokemon_model.dart';

import '../../../service/blocs/provided/pokemon_bloc.dart';

class PokemonPictures extends StatelessWidget {
  const PokemonPictures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<PokemonBloc>(context);
    return StreamBuilder<Pokemon>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final pkmn = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Image.network(
                        pkmn.sprites!.other!.officialArtwork!.frontDefault!),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Image.network(pkmn.sprites!.frontDefault!),
                        if (pkmn.sprites!.backDefault != null)
                          Image.network(pkmn.sprites!.backDefault!),
                        Image.network(pkmn.sprites!.frontShiny!),
                        if (pkmn.sprites!.backShiny != null)
                          Image.network(pkmn.sprites!.backShiny!),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData) {
            return const NoData();
          } else if (snapshot.hasError) {
            print('Pictures error : ${snapshot.error}');
          }
          return const LoadingData();
        });
  }
}
