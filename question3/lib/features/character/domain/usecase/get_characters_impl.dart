import 'package:dartz/dartz.dart';

import '../../presentation/usecase/get_characters.dart';
import '../entity/character.dart';
import '../repository/characters_repository.dart';

class GetCharactersImpl implements GetCharacters {
  final CharactersRepository repository;

  GetCharactersImpl(this.repository);
  @override
  Future<Either<String, List<Character>>> call({required int page}) {
    return repository.getCharacters(page: page);
  }
}
