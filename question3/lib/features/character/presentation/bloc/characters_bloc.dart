import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../services.dart';
import '../../domain/entity/character.dart';
import '../usecase/get_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  List<Character> characters = [];
  List<Character> filtered = [];
  var reload = true;
  var page = 1;
  CharactersBloc() : super(const CharactersState()) {
    on<GetInitialEvent>((event, emit) async {
      emit(CharactersState(
        characters: characters,
        message: 'loading',
        status: GetCharactersStatus.loading,
      ));
      emit(await getInital());
    });

    on<GetNextEvent>((event, emit) async {
      emit(CharactersState(
        characters: characters,
        message: 'loading',
        status: GetCharactersStatus.loading,
      ));

      emit(await getNext());
    });

    on<FilterEvent>((event, emit) async {
      emit(await getFiltered(event.filterValue));
    });
  }

  Future<CharactersState> getInital() async {
    page = 1;
    final callResult = await depLocator.get<GetCharacters>().call(page: page);
    var status = GetCharactersStatus.success;
    var message = '';
    callResult.fold(
      (l) {
        if (l.contains('not found')) {
          status = GetCharactersStatus.success;
          reload = false;
        } else {
          message = l;
          status = GetCharactersStatus.failed;
        }
      },
      (r) {
        characters = r;
        filtered = r;
        if (characters.isNotEmpty) {
          reload = true;
          page++;
        } else {
          reload = false;
        }
      },
    );

    return CharactersState(
      characters: characters,
      status: status,
      message: message,
    );
  }

  Future<CharactersState> getNext() async {
    if (!reload) {
      return CharactersState(
          status: GetCharactersStatus.endOfList,
          characters: characters,
          message: 'End of list reached');
    }
    debugPrint('## call usecase GetCharacter page $page');
    final callResult = await depLocator.get<GetCharacters>().call(page: page);
    var status = GetCharactersStatus.success;
    var message = '';
    callResult.fold(
      (l) {
        if (l.contains('not found')) {
          status = GetCharactersStatus.success;
          reload = false;
        } else {
          message = l;
          status = GetCharactersStatus.failed;
        }
      },
      (r) {
        characters.addAll(r);
        page++;
      },
    );

    //characters.sort((a, b) => a.teamId.compareTo(b.teamId));

    return CharactersState(
      characters: characters,
      status: status,
      message: message,
    );
  }

  Future<CharactersState> getFiltered(String filterValue) async {
    var status = GetCharactersStatus.success;
    var message = '';
    filtered =
        List.from(characters.where((e) => filterResponse(e, filterValue)));

    //characters.sort((a, b) => a.teamId.compareTo(b.teamId));

    return CharactersState(
      characters: filtered,
      status: status,
      message: message,
    );
  }

  bool filterResponse(Character e, String pattern) {
    if (pattern.isNotEmpty) {
      final condition = e.name.toLowerCase().contains(pattern.toLowerCase()) ||
          e.gender.toLowerCase().contains(pattern.toLowerCase()) ||
          e.species.toLowerCase().contains(pattern.toLowerCase());
      return condition;
    }
    return true;
  }

  EventTransformer<Event> debounce<Event>({
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }
}
