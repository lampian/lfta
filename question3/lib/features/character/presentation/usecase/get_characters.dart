import 'package:dartz/dartz.dart';

import '../../domain/entity/character.dart';

abstract class GetCharacters {
  Future<Either<String, List<Character>>> call({required int page});
}
