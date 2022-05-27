import 'package:flutter/material.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/provided/pokedex_bloc.dart';
import 'package:test_bloc/views/details/pokemon_detailed_view.dart';
import 'package:test_bloc/views/details/widgets/pokemon_pictures.dart';
import 'package:test_bloc/views/home/widgets/pokedex_list.dart';

import '../../components/cards/pokedex_card.dart';
import '../models/pokemon/pokemon_model.dart';
import 'provided/pokemon_bloc.dart';

class BlocRouter {
  // = Routes
  MaterialPageRoute pokemonDetails({required Pokemon pkmn}) =>
      MaterialPageRoute(builder: (context) => pokemon(pokemon: pkmn));

  // = Pokedex
  BlocProvider pokedex() => BlocProvider<PokedexBloc>(
      bloc: PokedexBloc(), child: const PokedexList());
  BlocProvider pokemonCard({required String name}) => BlocProvider<PokemonBloc>(
      bloc: PokemonBloc(name, null, fetch: true), child: const PokedexCard());

  // = Pokemon
  BlocProvider pokemon({required Pokemon pokemon}) => BlocProvider<PokemonBloc>(
      bloc: PokemonBloc(null, pokemon, fetch: false),
      child: const PokemonDetailedView());
  BlocProvider pokemonPictures({required Pokemon pokemon}) =>
      BlocProvider<PokemonBloc>(
          bloc: PokemonBloc(null, pokemon, fetch: false),
          child: const PokemonPictures());
}
