import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokemon_app/res/colors/colors.dart';
import 'package:pokemon_app/res/dimensions/dimensions.dart';
import 'package:pokemon_app/res/styles/styles.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final int value;

  const StatsCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: pokemonBold.copyWith(
                fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LinearPercentIndicator(
              lineHeight: 20.0,
              percent: value / 250,
              progressColor: ColorsApp.COLOR_PRIMARY,
              backgroundColor: Colors.black12,
              center: Text(
                value.toString(),
                style: pokemonRegular.copyWith(
                  color: Colors.white,
                  fontSize: Dimensions.FONT_SIZE_DEFAULT,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}