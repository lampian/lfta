import 'package:dartz/dartz.dart';
import 'package:lfta_question1/features/character/domain/entity/character.dart';
import '../../domain/repository/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  @override
  Future<Either<String, List<Character>>> getCharacters({required int page}) {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }
}
