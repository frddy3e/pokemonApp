
import 'package:pokemon_app/data/local/LocalApiService.dart';
import '../models/skill.dart';
import 'SkillsRepository.dart';

class SkillsRepositoryImplementation implements SkillsRepository {
  @override
  List<Skill> getAllSkills() {
    return LocalApiService().getSkills();
  }
}