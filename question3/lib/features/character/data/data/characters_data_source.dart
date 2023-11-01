import 'package:dartz/dartz.dart';
import '../../domain/entity/character.dart';

abstract class CharactersDataSource {
  Future<Either<String, List<Character>>> getCharctersFromApi(
      {required int page});
}
