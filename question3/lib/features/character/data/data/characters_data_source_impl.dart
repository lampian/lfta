import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:lfta_question1/core/api_services/app_http_client_impl.dart';
import 'package:lfta_question1/features/character/domain/entity/character.dart';
import '../model/character_model.dart';
import 'characters_data_source.dart';

class CharactersDataSourceImpl implements CharactersDataSource {
  final AppHttpClient client;

  CharactersDataSourceImpl(this.client);
  @override
  Future<Either<String, List<Character>>> getCharctersFromApi({
    required int page,
  }) async {
    final method = '/api/character?page=$page';
    try {
      final result = await client.get(method: method);
      if (result.statusCode == 200) {
        final decodedBody = jsonDecode(result.body);
        if (decodedBody is Map) {
          if (decodedBody.containsKey('results')) {
            final resultsJson = decodedBody['results'];
            if (resultsJson is List) {
              List<Character> characters = [];
              for (final item in resultsJson) {
                if (item is Map<String, dynamic>) {
                  final resultModel = CharacterModel.fromJson(item);
                  characters.add(resultModel.toEntity());
                }
              }
              return Right(characters);
            }
          }
        }
      } else if (result.statusCode == 404) {
        return const Left('not found');
      }
      return Left(result.reasonPhrase ?? 'Api error');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
