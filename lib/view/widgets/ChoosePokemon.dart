import 'package:flutter/material.dart';
import 'package:pokemon_app/res/colors/colors.dart';
import 'package:pokemon_app/res/dimensions/dimensions.dart';
import 'package:pokemon_app/res/styles/styles.dart';

import '../../res/constants/constants.dart';

class ChoosePokemon extends StatelessWidget {
  final String name;
  final bool isChosen;
  final String alignment;
  final VoidCallback onTap;

  const ChoosePokemon({Key? key, required this.name, required this.isChosen, required this.alignment, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isChosen ? Colors.black26 : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(alignment == AppConstants.leftSide ? 20 : 0),
              topRight: Radius.circular(alignment == AppConstants.rightSide ? 20 : 0),
              bottomLeft: Radius.circular(alignment == AppConstants.leftSide ? 20 : 0),
              bottomRight: Radius.circular(alignment == AppConstants.rightSide ? 20 : 0),
            ),
            border: Border.all(
              color: Colors.black26,
              width: 1,
            ),
          ),
          child: Text(
            name,
            style: pokemonBold.copyWith(
              color: isChosen ? Colors.white : ColorsApp.COLOR_PRIMARY,
              fontSize: Dimensions.FONT_SIZE_LARGE,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}