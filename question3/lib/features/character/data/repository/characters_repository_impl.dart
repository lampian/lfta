import 'package:dartz/dartz.dart';
import 'package:lfta_question1/features/character/data/data/characters_data_source.dart';
import 'package:lfta_question1/features/character/domain/entity/character.dart';
import '../../domain/repository/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDataSource dataSource;

  CharactersRepositoryImpl(this.dataSource);
  @override
  Future<Either<String, List<Character>>> getCharacters({required int page}) {
    // TODO(dev): Add check to use local persisted data if implemented and source fails
    return dataSource.getCharctersFromApi(page: page);
  }
}
