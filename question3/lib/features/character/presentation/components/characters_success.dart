import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfta_question1/features/character/presentation/components/search_tile.dart';

import '../../domain/entity/character.dart';
import '../bloc/characters_bloc.dart';
import 'characters_tile.dart';

class CharactersSuccess extends StatefulWidget {
  final List<Character> characters;
  const CharactersSuccess({
    super.key,
    required this.characters,
  });

  @override
  State<CharactersSuccess> createState() => _CharactersSuccessState();
}

class _CharactersSuccessState extends State<CharactersSuccess> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTile(),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.characters.length,
            itemBuilder: (context, index) {
              return CharactersTile(character: widget.characters[index]);
            },
          ),
        ),
      ],
    );
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 80) {
      final status = context.read<CharactersBloc>().state.status;
      if (status != GetCharactersStatus.loading) {
        debugPrint('## scroll listner => GetNextTeamsEvent()');
        context.read<CharactersBloc>().add(GetNextEvent());
      }
    }
  }
}
