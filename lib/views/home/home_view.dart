import 'package:flutter/material.dart';
import 'package:test_bloc/components/scaffold/appbar_component.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/provided/character_bloc.dart';
import 'package:test_bloc/views/home/widgets/characters_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: AppbarComponent(title: 'I ❤️ MARVEL'),
        preferredSize: Size(double.infinity, 50),
      ),

      body: BlocProvider<CharacterBloc>(
          bloc: CharacterBloc(), child: const CharacterList()),
    );
  }
}
