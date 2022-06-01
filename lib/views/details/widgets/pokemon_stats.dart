import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:test_bloc/components/streams/loading_data.dart';
import 'package:test_bloc/components/streams/no_data.dart';
import 'package:test_bloc/service/blocs/bloc_provider.dart';
import 'package:test_bloc/service/blocs/provided/stats_bloc.dart';
import 'package:test_bloc/service/models/pokemon/stats_model.dart';
import 'package:test_bloc/service/utils/couleur.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key? key}) : super(key: key);

  List<List<num>> data({
    required num hp,
    required num atk,
    required num def,
    required num speed,
    required num defSpe,
    required num atkSpe,
  }) =>
      [
        [hp, atk, def, speed, defSpe, atkSpe]
      ];

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<StatsBloc>(context);

    return StreamBuilder<List<Stats>>(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final int _hp = snapshot.data![0].baseStat!;
          final int _atk = snapshot.data![1].baseStat!;
          final int _def = snapshot.data![2].baseStat!;
          final int _atkSpe = snapshot.data![3].baseStat!;
          final int _defSpe = snapshot.data![4].baseStat!;
          final int _speed = snapshot.data![5].baseStat!;

          return Center(
            child: AspectRatio(
              aspectRatio: 1.3,
              child: RadarChart(
                ticks: const [100, 250],
                features: [
                  'hp : $_hp',
                  'atk : $_atk',
                  'def : $_def',
                  'speed : $_speed',
                  'defSpe : $_defSpe',
                  'atkSpe : $_atkSpe',
                ],
                data: data(
                    hp: _hp,
                    atk: _atk,
                    def: _def,
                    atkSpe: _atkSpe,
                    defSpe: _defSpe,
                    speed: _speed),
                graphColors: Couleur().dragon,
                axisColor: Couleur().grass,
                sides: 6,
                outlineColor: Couleur().bug,
              ),
            ),
          );
        } else if (!snapshot.hasData) {
          return const NoData();
        }
        return const LoadingData();
      },
    );
  }
}
