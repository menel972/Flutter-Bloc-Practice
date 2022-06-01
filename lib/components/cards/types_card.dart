import 'package:flutter/material.dart';
import 'package:test_bloc/service/models/pokemon/types_model.dart';

class TypesCard extends StatelessWidget {
  final String type;
  const TypesCard({Key? key, required this.type}) : super(key: key);

  List<Color> get color {
    final selected =
        Types().types.firstWhere((element) => element['name'] == type)['color'];

    if (selected.runtimeType == List<Color>) {
      return selected;
    }
    return [selected];
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    if (color.length > 1) {
      return Container(
        width: size.width * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: color,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(type),
      );
    }
    return Container(
      width: size.width * 0.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color[0],
        borderRadius: BorderRadius.circular(3),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Text(type),
    );
  }
}
