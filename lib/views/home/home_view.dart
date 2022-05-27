// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/scaffold/appbar_component.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/provided/flitre_bloc.dart';
import 'package:test_bloc/service/blocs/provided/pokedex_bloc.dart';
import 'package:test_bloc/views/home/widgets/pokedex_list.dart';


class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final FilterBloc _bloc = FilterBloc();
  final PokedexBloc _bloc2 = PokedexBloc('');

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: const PreferredSize(
        child: AppbarComponent(title: 'I ❤️ POKEMON'),
        preferredSize: Size(double.infinity, 50),
      ),

      body: StreamBuilder<String>(
          stream: _bloc.stream,
          builder: (context, snapshot) {
            return Column(
              children: [
                TextFormField(
                  onChanged: (val) => {
                    _bloc.fetchFilter(val),
                    print(snapshot.data!),
                  },
                ),
                Expanded(
                  child: BlocProvider<PokedexBloc>(
                      bloc: PokedexBloc(snapshot.data!),
                      child: const PokedexList()),
                ),
              ],
            );
          }),
    );
  }
}
