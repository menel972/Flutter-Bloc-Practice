import 'package:flutter/material.dart';
import 'package:test_bloc/components/scaffold/appbar_component.dart';
import 'package:test_bloc/service/API/marvel_api.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MarvelApi().fetchCharacters('');
    return const Scaffold(
      appBar: PreferredSize(
        child: AppbarComponent(title: 'I ❤️ MARVEL'),
        preferredSize: Size(double.infinity, 50),
      ),
    );
  }
}
