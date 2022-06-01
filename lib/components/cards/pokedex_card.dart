// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_bloc/components/cards/pokedex_card_loading.dart';
import 'package:test_bloc/components/cards/types_card.dart';
import 'package:test_bloc/components/streams/loading_data.dart';
import 'package:test_bloc/service/blocs/bloc_router.dart';

import '../../service/blocs/bloc_provider.dart';
import '../../service/blocs/provided/pokemon_bloc.dart';
import '../../service/models/pokemon/pokemon_model.dart';

class PokedexCard extends StatelessWidget {
  const PokedexCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<PokemonBloc>(context);
    Size size = Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return StreamBuilder<Pokemon>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Pokemon pkmn = snapshot.data!;
            return GestureDetector(
              onTap: () async => await Navigator.push(
                  context, BlocRouter().pokemonDetails(pkmn: pkmn)),
              child: Card(
                  elevation: 0,
                  child: SizedBox(
                    height: size.height * 0.6,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.network(
                            pkmn.sprites!.other!.officialArtwork!.frontDefault!,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Shimmer.fromColors(
                                baseColor: Colors.black45,
                                highlightColor: Colors.black12,
                                child: Container(
                                  height: size.height * 0.5,
                                  color: Colors.black45,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(pkmn.name!),
                              Row(
                                children: [
                                  TypesCard(type: pkmn.types![0].type!.name!),
                                  const SizedBox(width: 10),
                                  if (pkmn.types!.length > 1) ...{
                                    TypesCard(type: pkmn.types![1].type!.name!),
                                  } else ...{
                                    const Text(''),
                                  }
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          } else if (!snapshot.hasData) {
            return const PokedexCardLoading();
          } else if (snapshot.hasError) {
            print('pokemon card error : ${snapshot.error}');
          }
          return const LoadingData();
        });
  }
}
