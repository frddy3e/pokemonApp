import 'package:flutter/material.dart';
import 'package:pokemon_app/view/widgets/SkillCard.dart';
import 'package:pokemon_app/view_model/SkillsVM.dart';
import 'package:provider/provider.dart';

import '../../data/remote/responses/Status.dart';
import '../../models/pokemon.dart';
import '../../models/skill.dart';
import '../../res/colors/colors.dart';
import '../../res/dimensions/dimensions.dart';
import '../../res/styles/styles.dart';
class SkillsDetails extends StatefulWidget {

  Pokemon pokemon;
  List<Skill> skills;
  SkillsDetails({Key? key, required this.skills, required this.pokemon}) : super(key: key);

  @override
  State<SkillsDetails> createState() => _SkillsDetailsState();
}

class _SkillsDetailsState extends State<SkillsDetails> {
  final SkillsVM viewModel = SkillsVM();

  Skill _choosenSkill = Skill();

  @override
  void initState() {
    viewModel.fetchSkills();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
              "Habilidades",
              style: pokemonBold.copyWith(
                color: ColorsApp.COLOR_PRIMARY,
                fontSize: Dimensions.FONT_SIZE_OVER_LARGE,
              ),
              textAlign: TextAlign.left
          ),
        ),
        ChangeNotifierProvider<SkillsVM>(
          create: (BuildContext context) => viewModel,
          child: Consumer<SkillsVM>(builder: (context, viewModel, _) {
            switch (viewModel.skillsMain.status) {
              case Status.LOADING:
                print("LOADING");
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                print("ERROR");
                return Center(child: Text(viewModel.skillsMain.message ?? "NA"));
              case Status.COMPLETED:
                print("COMPLETED");
                return _getSkillListView(viewModel.skillsMain.data);
              default:
            }
            return Container();
          }),
        ),
        widget.skills.isEmpty ? Container(
          alignment: Alignment.centerLeft,
          child: Text(
              "Aún no tiene habilidades asignadas",
              style: pokemonBold.copyWith(
                color: ColorsApp.COLOR_PRIMARY,
                fontSize: Dimensions.FONT_SIZE_LARGE,
              ),
              textAlign: TextAlign.left
          ),
        ): _listSkillItem(widget.skills),
        SizedBox(height: 40,),
        _choosenSkill.name != "" ? Container(
          alignment: Alignment.centerLeft,
          child: Text(
              _choosenSkill.description?? "",
              style: pokemonBold.copyWith(
                color: ColorsApp.COLOR_PRIMARY,
                fontSize: Dimensions.FONT_SIZE_LARGE,
              ),
              textAlign: TextAlign.left
          ),
        ): Container(),
      ],
    );
  }

  Widget _listSkillItem(List<Skill> skills) {
    return Text(skills.map((e) => e.name).join(", "));
  }


  Widget _getSkillListView(List<Skill>? skillsList) {
    print(skillsList?.length);
    return Container(
      height: 100,
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3,
        children: List.generate(skillsList?.length ?? 0, (index) {
          return SkillCard(
              skill: skillsList![index],
            isSelected: widget.skills.contains(skillsList[index]),
            onTap: (){
              setState(() => _choosenSkill = skillsList[index]);

            },
          );
        }),
      ),
    );
  }
}