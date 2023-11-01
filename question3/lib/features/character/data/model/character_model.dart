import 'package:json_annotation/json_annotation.dart';
import 'package:lfta_question1/features/character/data/model/location_model.dart';
import 'package:lfta_question1/features/character/data/model/origin_model.dart';
import '../../domain/entity/character.dart';
part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OriginModel origin;
  final LocationModel location;
  final String image;
  final String url;
  final String created;

  const CharacterModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const OriginModel(),
    this.location = const LocationModel(),
    this.image = '',
    this.url = '',
    this.created = '',
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);

  Character toEntity() {
    return Character(
      created: created,
      gender: gender,
      id: id,
      imageUrl: image,
      locationName: location.name,
      locationUrl: location.url,
      name: name,
      originName: origin.name,
      originUrl: origin.url,
      species: species,
      status: status,
      type: type,
      url: url,
    );
  }
}
