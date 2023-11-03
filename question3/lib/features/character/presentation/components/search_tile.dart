import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lfta_question1/core/api_services/colors.dart';
import 'package:lfta_question1/features/character/presentation/bloc/characters_bloc.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<CharactersBloc>().add(
            FilterEvent(value),
          ),
      style: const TextStyle(color: AppColors.white1),
      cursorColor: AppColors.white1,
      decoration: InputDecoration(
        hintText: 'Find your favourite character',
        hintStyle: TextStyle(color: AppColors.white1.withOpacity(0.5)),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.white1,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white1),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white1),
        ),
      ),
    );
  }
}
