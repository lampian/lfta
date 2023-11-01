import 'package:flutter/material.dart';
import '../../domain/entity/character.dart';

class CharactersTile extends StatelessWidget {
  const CharactersTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    var venue = '';
    var city = '';
    var since = '';
    var subTitle = '$venue$city$since';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TeamLabel(character: character),
                  const SizedBox(height: 8),
                  HomeInfo(subTitle: subTitle),
                ],
              ),
              CallToActionShowDetail(character: character),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamLabel extends StatelessWidget {
  const TeamLabel({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${character.name}',
      style: const TextStyle(
          color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w800),
    );
  }
}

class HomeInfo extends StatelessWidget {
  const HomeInfo({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.home,
          color: Colors.black45,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          subTitle,
          style: const TextStyle(
              color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
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
      onTap: () {
        // TODO(dev): add jump to detail
      },
      child: const SizedBox(
        width: 50,
        height: 50,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.chevron_right,
            color: Colors.black54,
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
