
import 'package:pokemon_app/models/skill.dart';

class LocalApiService {
  List<Skill> getSkills() {
    return [
      Skill(
        name: 'Intimidación',
        description: 'Aumenta ataque en 10 y velocidad en 15, reduce vida 5 y defensa en 10',
        attack: 10,
        defense: -10,
        speed: 15,
        hp: -5,
      ),
      Skill(
        name: 'Inmunidad',
        description: 'Aumenta vida en 10, defensa en 20, reduce ataque en 20 y velocidad en 10',
        attack: -20,
        defense: 20,
        speed: -10,
        hp: 10,
      ),
      Skill(
        name: 'Potencia',
        description: 'Aumenta ataque en 15, velocidad en 15, reduce vida en 20 y defensa en 10',
        attack: 15,
        defense: -10,
        speed: 15,
        hp: -20,
      ),
      Skill(
        name: 'Regeneración',
        description: 'Aumenta vida en 10, velocidad en 5 y defensa en 5 reduce ataque 20',
        attack: -20,
        defense: 5,
        speed: 5,
        hp: 10,
      ),
      Skill(
        name: 'Impacible',
        description: 'Aumenta velocidad en 30, reduce vida en 10, defensa en 10 y ataque en 3',
        attack: -3,
        defense: -10,
        speed: 30,
        hp: -10,
      ),
      Skill(
        name: 'Tóxico',
        description: 'Aumenta defensa en 20, reduce vida en 15, velocidad en 3 y ataque 0',
        attack: 0,
        defense: 20,
        speed: -3,
        hp: -15,
      ),
    ];
  }
}