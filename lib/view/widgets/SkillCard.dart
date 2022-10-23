
import 'package:flutter/material.dart';
import 'package:pokemon_app/models/skill.dart';
import 'package:pokemon_app/res/dimensions/dimensions.dart';
import 'package:pokemon_app/res/styles/styles.dart';

class SkillCard extends StatelessWidget{
  final Skill skill;
  final bool isSelected;
  final VoidCallback onTap;
  SkillCard({required this.skill, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black26 : Colors.white,
          ),
          child: Text(
            skill.name ?? "",
            style: pokemonRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
            ),
          ),
        ),
      ),
    );
  }
}