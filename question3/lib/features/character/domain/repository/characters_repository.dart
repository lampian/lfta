import 'package:dartz/dartz.dart';
import '../entity/character.dart';

abstract class CharactersRepository {
  Future<Either<String, List<Character>>> getCharacters({required int page});
}
