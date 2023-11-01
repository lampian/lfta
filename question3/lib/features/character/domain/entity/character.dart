import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String originName;
  final String originUrl;
  final String locationName;
  final String locationUrl;
  final String imageUrl;
  final String url;
  final String created;

  const Character({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.originName = '',
    this.originUrl = '',
    this.locationName = '',
    this.locationUrl = '',
    this.imageUrl = '',
    this.url = '',
    this.created = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        originName,
        originUrl,
        locationName,
        locationUrl,
        imageUrl,
        url,
        created,
      ];
}
