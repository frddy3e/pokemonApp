
import 'package:flutter/material.dart';

import '../data/remote/responses/ApiResponse.dart';
import '../models/pokemon.dart';
import '../models/skill.dart';
import '../repository/PokemonRepositoryImplementation.dart';

class PokemonVM extends ChangeNotifier{
  final _myRepo = PokemonReposotoryImplementation();

  ApiResponse<Pokemon> pokemonMain = ApiResponse.loading();

  void _setPokemonMain(ApiResponse<Pokemon> response) {
    pokemonMain = response;
    notifyListeners();
  }

  Future<void> fetchPokemon(int id) async {
    _setPokemonMain(ApiResponse.loading());
    _myRepo
        .getPokemon(id)
        .then((value) => _setPokemonMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setPokemonMain(ApiResponse.error(error.toString())));
  }

  void addPokemonSkill(Pokemon pokemon, Skill skill) {
    List<Skill> skills = pokemon.skills ?? [];
    // 2 skills max
    if(skills.length >= 2){
      return;
    }

    skills.add(skill);
    pokemon.skills = skills;

    int hp = pokemon.hp ?? 0;
    int attack = pokemon.attack ?? 0;
    int defense = pokemon.defense ?? 0;
    int speed = pokemon.speed ?? 0;
    hp += skill.hp ?? 0;
    attack += skill.attack ?? 0;
    defense += skill.defense ?? 0;
    speed += skill.speed ?? 0;

    pokemon.hp = hp;
    pokemon.attack = attack;
    pokemon.defense = defense;
    pokemon.speed = speed;

    _setPokemonMain(ApiResponse.completed(pokemon));
    notifyListeners();
  }

  void removePokemonSkill(Pokemon pokemon, Skill skill) {
    List<Skill> skills = pokemon.skills ?? [];
    if (skills.length > 0) {
      skills.remove(skill);
      pokemon.skills = skills;
    }

    int hp = pokemon.hp ?? 0;
    int attack = pokemon.attack ?? 0;
    int defense = pokemon.defense ?? 0;
    int speed = pokemon.speed ?? 0;

    hp -= skill.hp ?? 0;
    attack -= skill.attack ?? 0;
    defense -= skill.defense ?? 0;
    speed -= skill.speed ?? 0;

    pokemon.hp = hp;
    pokemon.attack = attack;
    pokemon.defense = defense;
    pokemon.speed = speed;

    _setPokemonMain(ApiResponse.completed(pokemon));
    notifyListeners();
  }
}