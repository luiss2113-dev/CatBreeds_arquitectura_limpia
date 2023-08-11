// To parse this JSON data, do
//
//     final BreedEntity = BreedEntityFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/helpers/constants.dart';

///Mapeo de CatsBreesd response de BreedEntity
class BreedEntity extends Equatable {
  final String? id;
  final String? description;
  final String? temperament;
  final String? origin;
  final String? name;
  final int? dogFriendly;
  final int? intelligence;
  final String? wikipediaUrl;
  final int? socialNeeds;
  final String? referenceImageId;
  final int? energyLevel;

  const BreedEntity(
      {this.id,
      this.referenceImageId,
      this.name,
      this.intelligence,
      this.origin,
      this.description,
      this.temperament,
      this.dogFriendly,
      this.energyLevel,
      this.socialNeeds,
      this.wikipediaUrl});

  String get idImage => '$id$referenceImageId';
  String get imageCat => '${Constants.images}$referenceImageId.jpg';
  String get nameCategory => name ?? 'Desconocido';
  String get originCat => origin ?? 'Desconocido';
  String get descriptionCat => description ?? 'Desconocido';
  String get temperamentCat => temperament ?? 'Desconocido';
  String get dogFriendlyCat =>
      dogFriendly == null ? 'Desconocido' : '$dogFriendly';
  String get energyLevelCat =>
      energyLevel == null ? 'Desconocido' : '$energyLevel';
  String get socialNeedsCat =>
      socialNeeds == null ? 'Desconocido' : '$socialNeeds';
  String get wikipediaUrlCat => wikipediaUrl ?? 'Desconocido';

  factory BreedEntity.fromRawJsonEntity(String str) =>
      BreedEntity.fromJson(json.decode(str));

  String toRawJsonEntity() => json.encode(toJsonEntity());

  //Function convert string to list<BreedEntity>
  static List<BreedEntity> fromListJson(String str) {
    final jsonData = json.decode(str);
    if (jsonData == null) return List<BreedEntity>.empty();
    try {
      return List<BreedEntity>.from(
          jsonData.map((x) => BreedEntity.fromJson(x)));
    } catch (e) {
      return List<BreedEntity>.empty();
    }
  }

  factory BreedEntity.fromJson(Map<String, dynamic> json) => BreedEntity(
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        description: json["description"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        intelligence: json["intelligence"],
        socialNeeds: json["social_needs"],
        wikipediaUrl: json["wikipedia_url"],
        referenceImageId: json["reference_image_id"],
      );

  Map<String, dynamic> toJsonEntity() => {
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "description": description,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "intelligence": intelligence,
        "social_needs": socialNeeds,
        "wikipedia_url": wikipediaUrl,
        "reference_image_id": referenceImageId,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        temperament,
        origin,
        description,
        dogFriendly,
        energyLevel,
        intelligence,
        socialNeeds,
        wikipediaUrl,
        referenceImageId,
      ];

  BreedEntity copyWith({
    String? id,
    String? description,
    String? temperament,
    String? origin,
    String? name,
    int? dogFriendly,
    int? intelligence,
    String? wikipediaUrl,
    int? socialNeeds,
    String? referenceImageId,
    int? energyLevel,
  }) {
    return BreedEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      name: name ?? this.name,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      intelligence: intelligence ?? this.intelligence,
      wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      referenceImageId: referenceImageId ?? this.referenceImageId,
      energyLevel: energyLevel ?? this.energyLevel,
    );
  }
}
