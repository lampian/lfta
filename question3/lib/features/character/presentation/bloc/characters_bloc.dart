import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../services.dart';
import '../../domain/entity/character.dart';
import '../usecase/get_characters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  List<Character> characters = [];
  var reload = true;
  var page = 1;
  CharactersBloc() : super(const CharactersState()) {
    on<GetInitialEvent>((event, emit) async {
      emit(await getInital());
    });

    on<GetNextEvent>((event, emit) async {
      emit(await getNext());
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

  EventTransformer<Event> debounce<Event>({
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }
}
