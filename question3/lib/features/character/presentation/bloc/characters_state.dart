part of 'characters_bloc.dart';

enum GetCharactersStatus { initial, success, failed, loading, endOfList }

class CharactersState {
  final GetCharactersStatus status;
  final List<Character> characters;
  final String message;

  const CharactersState({
    this.status = GetCharactersStatus.initial,
    this.characters = const [],
    this.message = '',
  });
}
