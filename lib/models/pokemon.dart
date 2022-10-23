import 'dart:convert';

import 'package:pokemon_app/models/skill.dart';

class PokemonList {
  PokemonList({
    this.pokemonList,
  });

  List<Pokemon>? pokemonList;

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        pokemonList: List<Pokemon>.from(
            json["results"].map((x) => Pokemon.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "results":
            List<dynamic>.from(pokemonList!.map((x) => x.toJson())),
      };
}

class Pokemon {
  Pokemon({
    this.id,
    this.name,
    this.imageUrl,
    this.hp,
    this.attack,
    this.defense,
    this.speed,
    this.skills,
  });

    int? id;
    String? name;
    String? imageUrl;
    int? hp;
    int? attack;
    int? defense;
    int? speed;
    List<Skill>? skills;


    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        hp: json["hp"] == null ? null : json["hp"],
        attack: json["attack"] == null ? null : json["attack"],
        defense: json["defense"] == null ? null : json["defense"],
        speed: json["speed"] == null ? null : json["speed"],
        //skills: json["habilitiesId"] == null ? null : List<int>.from(json["habilitiesId"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "hp": hp == null ? null : hp,
        "attack": attack == null ? null : attack,
        "defense": defense == null ? null : defense,
        "speed": speed == null ? null : speed,
        //"habilitiesId": skillIds == null ? null : List<dynamic>.from(skillIds!.map((x) => x)),
    };
}