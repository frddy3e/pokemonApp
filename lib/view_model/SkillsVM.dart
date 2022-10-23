
import 'package:flutter/material.dart';
import 'package:pokemon_app/repository/SkillsRepositoryImplementation.dart';

import '../data/remote/responses/ApiResponse.dart';
import '../models/skill.dart';

class SkillsVM extends ChangeNotifier{
  final _myRepo = SkillsRepositoryImplementation();

  ApiResponse<List<Skill>> skillsMain = ApiResponse.loading();

  void _setSkillsMain(ApiResponse<List<Skill>> response) {
    skillsMain = response;
    notifyListeners();
  }

  Future<void> fetchSkills() async {
    _setSkillsMain(ApiResponse.loading());
    _setSkillsMain(ApiResponse.completed(_myRepo.getAllSkills()));
  }
}
