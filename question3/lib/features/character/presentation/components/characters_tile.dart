import 'package:flutter/material.dart';
import 'package:lfta_question1/core/api_services/colors.dart';
import 'package:lfta_question1/features/character/presentation/page/characters_detail_page.dart';
import '../../domain/entity/character.dart';

class CharactersTile extends StatelessWidget {
  const CharactersTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final otherWidth = MediaQuery.of(context).size.width * 0.6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gray1,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  character.imageUrl,
                  height: 80,
                ),
              ),
              // TODO(dev): use CustomNetworkImage
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameLabel(character: character),
                    const SizedBox(height: 8),
                    OtherInfo(character: character, width: otherWidth),
                  ],
                ),
              ),
              CallToActionShowDetail(character: character),
            ],
          ),
        ),
      ),
    );
  }
}

class NameLabel extends StatelessWidget {
  const NameLabel({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Text(
      character.name,
      style: const TextStyle(
        color: AppColors.white1,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({
    super.key,
    required this.character,
    required this.width,
  });

  final Character character;
  final double width;

  @override
  Widget build(BuildContext context) {
    final subTitle = 'I am a ${character.gender.toLowerCase()} '
        '${character.species.toLowerCase()} from ${character.locationName}';
    return SizedBox(
      width: width,
      child: Text(
        subTitle,
        maxLines: 2,
        overflow: TextOverflow.clip,
        style: const TextStyle(
          color: AppColors.white1,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CallToActionShowDetail extends StatelessWidget {
  const CallToActionShowDetail({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CharacterDetailPage(character: character);
          },
        ));
      },
      child: const SizedBox(
        width: 50,
        height: 50,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.chevron_right,
            color: AppColors.white1,
          ),
        ),
      ),
    );
  }
}

class Label1 extends StatelessWidget {
  final String label;
  const Label1({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
