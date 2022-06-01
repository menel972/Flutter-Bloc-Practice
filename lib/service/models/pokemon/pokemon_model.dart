import 'sprites_model.dart';
import 'stats_model.dart';

import 'abilities_model.dart';
import 'ability_model.dart';
import 'game_indices_model.dart';
import 'held_items_model.dart';
import 'moves_model.dart';
import 'types_model.dart';

class Pokemon {
  List<Abilities>? abilities;
  int? baseExperience;
  List<Ability>? forms;
  List<GameIndices>? gameIndices;
  int? height;
  List<HeldItems>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Moves>? moves;
  String? name;
  int? order;
  List<String?>? pastTypes;
  Ability? species;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;

  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['forms'] != null) {
      forms = <Ability>[];
      json['forms'].forEach((v) {
        forms!.add(Ability.fromJson(v));
      });
    }
    if (json['game_indices'] != null) {
      gameIndices = <GameIndices>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndices.fromJson(v));
      });
    }
    height = json['height'];
    if (json['held_items'] != null) {
      heldItems = <HeldItems>[];
      json['held_items'].forEach((v) {
        heldItems!.add(HeldItems.fromJson(v));
      });
    }
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    if (json['past_types'] != null) {
      pastTypes = <String>[];
      json['past_types'].forEach((v) {
        pastTypes!.add(v.fromJson(v));
      });
    }
    species =
        json['species'] != null ? Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    if (forms != null) {
      data['forms'] = forms!.map((v) => v.toJson()).toList();
    }
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    if (heldItems != null) {
      data['held_items'] = heldItems!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['order'] = order;
    if (pastTypes != null) {
      data['past_types'] = pastTypes!.map((v) => v).toList();
    }
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}
