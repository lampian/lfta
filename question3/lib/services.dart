import 'package:get_it/get_it.dart';

import 'core/api_services/app_http_client.dart';
import 'core/api_services/app_http_client_impl.dart';
import 'features/character/data/data/characters_data_source.dart';
import 'features/character/data/data/characters_data_source_impl.dart';
import 'features/character/data/repository/characters_repository_impl.dart';
import 'features/character/domain/repository/characters_repository.dart';
import 'features/character/domain/usecase/get_characters_impl.dart';
import 'features/character/presentation/usecase/get_characters.dart';

final depLocator = GetIt.instance;

void registerGetItDependencies() {
  depLocator.registerSingleton<AppHttpClient>(
      HttpClientImpl('https://rickandmortyapi.com'));
  _setUpCharacters();
}

void _setUpCharacters() {
  final httpClientImpl = depLocator.get<AppHttpClient>();
  depLocator.registerLazySingleton<CharactersDataSource>(() {
    return CharactersDataSourceImpl(httpClientImpl);
  });
  final source = depLocator.get<CharactersDataSource>();
  depLocator.registerLazySingleton<CharactersRepository>(() {
    return CharactersRepositoryImpl(source);
  });
  final repo = depLocator.get<CharactersRepository>();
  depLocator.registerLazySingleton<GetCharacters>(() {
    return GetCharactersImpl(repo);
  });
}
