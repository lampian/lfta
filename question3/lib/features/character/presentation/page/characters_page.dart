import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfta_question1/core/api_services/colors.dart';
import '../bloc/characters_bloc.dart';
import '../components/app_snack_bar.dart';
import '../components/characters_failed.dart';
import '../components/characters_loading.dart';
import '../components/characters_success.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  @override
  void initState() {
    context.read<CharactersBloc>().add(GetInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: AppColors.white1,
        title: const Text(
          'Rick & Morty',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.gray2,
          ),
        ),
      ),
      body: const CharactersPageBody(),
    );
  }
}

class CharactersPageBody extends StatelessWidget {
  const CharactersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharactersBloc, CharactersState>(
      listener: (context, state) {
        if (state.status == GetCharactersStatus.failed) {
          AppSnackBar(context).show(message: state.message);
        } else if (state.status == GetCharactersStatus.loading) {
          AppSnackBar(context).show(message: state.message);
        } else if (state.status == GetCharactersStatus.endOfList) {
          AppSnackBar(context).show(message: state.message);
        }
      },
      builder: (context, state) {
        debugPrint('## bloc ${state.status} len: ${state.characters.length}');
        // TODO(dev): replace with modified switch using dart 3 ?
        if (state.status == GetCharactersStatus.failed) {
          return const CharactersFailed(
            message: 'www',
          );
        } else if (state.status == GetCharactersStatus.initial) {
          return const CharactersLoading();
        } else if (state.status == GetCharactersStatus.loading) {
          return CharactersSuccess(characters: state.characters);
        } else {
          return CharactersSuccess(characters: state.characters);
        }
      },
    );
  }
}
