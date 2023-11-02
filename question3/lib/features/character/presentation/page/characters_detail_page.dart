import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/api_services/colors.dart';
import '../../domain/entity/character.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: AppColors.white1,
        iconTheme: const IconThemeData(color: AppColors.gray2),
        title: Text(
          character.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.gray2,
          ),
        ),
      ),
      body: CharacterDetailPageBody(character: character),
    );
  }
}

class CharacterDetailPageBody extends StatelessWidget {
  final Character character;
  const CharacterDetailPageBody({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    final dateTime = DateTime.tryParse(character.created) ?? DateTime.now();
    String date = DateFormat.yMMMEd().format(dateTime);
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.network(
              character.imageUrl,
              width: width,
            ),
          ),
          // TODO(dev): use CustomNetworkImage
          const SizedBox(height: 32),
          SizedBox(
            width: width,
            child: Text(
              'Hello! \n'
              'I am ${character.name},\n'
              'a ${character.species.toLowerCase()} from '
              '${character.locationName.toLowerCase()}\n'
              '\n'
              'I was created on:\n$date',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: const TextStyle(
                color: AppColors.white1,
                fontSize: 23,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
