import 'package:test_bloc/service/utils/couleur.dart';

import 'ability_model.dart';

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }

  List<Map<String, dynamic>> types = [
    {'name': 'normal', 'color': Couleur().normal},
    {'name': 'fighting', 'color': Couleur().fighting},
    {'name': 'flying', 'color': Couleur().flying},
    {'name': 'poison', 'color': Couleur().poison},
    {'name': 'ground', 'color': Couleur().ground},
    {'name': 'rock', 'color': Couleur().rock},
    {'name': 'bug', 'color': Couleur().bug},
    {'name': 'ghost', 'color': Couleur().ghost},
    {'name': 'steel', 'color': Couleur().steel},
    {'name': 'fire', 'color': Couleur().fire},
    {'name': 'water', 'color': Couleur().water},
    {'name': 'grass', 'color': Couleur().grass},
    {'name': 'electric', 'color': Couleur().electric},
    {'name': 'psychic', 'color': Couleur().psychic},
    {'name': 'ice', 'color': Couleur().ice},
    {'name': 'dragon', 'color': Couleur().dragon},
    {'name': 'dark', 'color': Couleur().dark},
    {'name': 'fairy', 'color': Couleur().fairy},
  ];
}
