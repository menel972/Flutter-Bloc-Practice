// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_bloc/components/scaffold/appbar_component.dart';
import 'package:test_bloc/service/blocs/bloc_router.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: const PreferredSize(
        child: AppbarComponent(title: 'I ❤️ POKEMON'),
        preferredSize: Size(double.infinity, 50),
      ),

      body: BlocRouter().pokedex(),
    );
  }
}
