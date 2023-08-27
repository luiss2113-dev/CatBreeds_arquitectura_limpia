// To parse this JSON data, do
//
//     final breeds = breedsFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../data/helpers/constants.dart';
import '../entities/breeds_entity.dart';

///Mapeo de CatsBreesd response de Breeds
class Breeds extends BreedEntity {
  final Weight? weight;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? countryCodes;
  final String? countryCode;
  final String? lifeSpan;
  final int? indoor;
  final int? lap;
  final String? altNames;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? grooming;
  final int? healthIssues;
  final int? sheddingLevel;
  final int? strangerFriendly;
  final int? vocalisation;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final int? hypoallergenic;
  final int? catFriendly;
  final int? bidability;

  const Breeds({
    this.weight,
    super.id,
    super.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    super.temperament,
    super.origin,
    this.countryCodes,
    this.countryCode,
    super.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    super.dogFriendly,
    super.energyLevel,
    this.grooming,
    this.healthIssues,
    super.intelligence,
    this.sheddingLevel,
    super.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    super.wikipediaUrl,
    this.hypoallergenic,
    super.referenceImageId,
    this.catFriendly,
    this.bidability,
  });

  @override
  String get idImage => '$id$referenceImageId';
  @override
  String get imageCat => '${Constants.images}$referenceImageId.jpg';
  @override
  String get nameCategory => name ?? 'Desconocido';
  @override
  String get originCat => origin ?? 'Desconocido';
  @override
  String get descriptionCat => description ?? 'Desconocido';
  @override
  String get temperamentCat => temperament ?? 'Desconocido';
  @override
  String get dogFriendlyCat =>
      dogFriendly == null ? 'Desconocido' : '$dogFriendly';
  @override
  String get energyLevelCat =>
      energyLevel == null ? 'Desconocido' : '$energyLevel';
  @override
  String get socialNeedsCat =>
      socialNeeds == null ? 'Desconocido' : '$socialNeeds';
  @override
  String get wikipediaUrlCat => wikipediaUrl ?? 'Desconocido';

  @override
  Breeds copyWith({
    Weight? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
    int? catFriendly,
    int? bidability,
  }) =>
      Breeds(
        weight: weight ?? this.weight,
        id: id ?? this.id,
        name: name ?? this.name,
        cfaUrl: cfaUrl ?? this.cfaUrl,
        vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
        vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
        temperament: temperament ?? this.temperament,
        origin: origin ?? this.origin,
        countryCodes: countryCodes ?? this.countryCodes,
        countryCode: countryCode ?? this.countryCode,
        description: description ?? this.description,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        indoor: indoor ?? this.indoor,
        lap: lap ?? this.lap,
        altNames: altNames ?? this.altNames,
        adaptability: adaptability ?? this.adaptability,
        affectionLevel: affectionLevel ?? this.affectionLevel,
        childFriendly: childFriendly ?? this.childFriendly,
        dogFriendly: dogFriendly ?? this.dogFriendly,
        energyLevel: energyLevel ?? this.energyLevel,
        grooming: grooming ?? this.grooming,
        healthIssues: healthIssues ?? this.healthIssues,
        intelligence: intelligence ?? this.intelligence,
        sheddingLevel: sheddingLevel ?? this.sheddingLevel,
        socialNeeds: socialNeeds ?? this.socialNeeds,
        strangerFriendly: strangerFriendly ?? this.strangerFriendly,
        vocalisation: vocalisation ?? this.vocalisation,
        experimental: experimental ?? this.experimental,
        hairless: hairless ?? this.hairless,
        natural: natural ?? this.natural,
        rare: rare ?? this.rare,
        rex: rex ?? this.rex,
        suppressedTail: suppressedTail ?? this.suppressedTail,
        shortLegs: shortLegs ?? this.shortLegs,
        wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
        hypoallergenic: hypoallergenic ?? this.hypoallergenic,
        referenceImageId: referenceImageId ?? this.referenceImageId,
        catFriendly: catFriendly ?? this.catFriendly,
        bidability: bidability ?? this.bidability,
      );

  factory Breeds.fromRawJson(String str) => Breeds.fromJson(json.decode(str));

  //Function convert string to list<Breeds>
  static List<Breeds> fromListJson(String str) {
    final jsonData = json.decode(str);
    if (jsonData == null) return List<Breeds>.empty();
    try {
      return List<Breeds>.from(jsonData.map((x) => Breeds.fromJson(x)));
    } catch (e) {
      return List<Breeds>.empty();
    }
  }

  factory Breeds.fromJson(Map<String, dynamic> json) => Breeds(
        weight: json["weight"] == null ? null : Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        cfaUrl: json["cfa_url"],
        vetstreetUrl: json["vetstreet_url"],
        vcahospitalsUrl: json["vcahospitals_url"],
        temperament: json["temperament"],
        origin: json["origin"],
        countryCodes: json["country_codes"],
        countryCode: json["country_code"],
        description: json["description"],
        lifeSpan: json["life_span"],
        indoor: json["indoor"],
        lap: json["lap"],
        altNames: json["alt_names"],
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        experimental: json["experimental"],
        hairless: json["hairless"],
        natural: json["natural"],
        rare: json["rare"],
        rex: json["rex"],
        suppressedTail: json["suppressed_tail"],
        shortLegs: json["short_legs"],
        wikipediaUrl: json["wikipedia_url"],
        hypoallergenic: json["hypoallergenic"],
        referenceImageId: json["reference_image_id"],
        catFriendly: json["cat_friendly"],
        bidability: json["bidability"],
      );

  @override
  List<Object?> get props => [
        weight,
        id,
        name,
        cfaUrl,
        vetstreetUrl,
        vcahospitalsUrl,
        temperament,
        origin,
        countryCodes,
        countryCode,
        description,
        lifeSpan,
        indoor,
        lap,
        altNames,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        healthIssues,
        intelligence,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        wikipediaUrl,
        hypoallergenic,
        referenceImageId,
        catFriendly,
        bidability,
      ];

  @override
  bool? get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'weight': weight?.toJson(),
      'cfaUrl': cfaUrl,
      'vetstreetUrl': vetstreetUrl,
      'vcahospitalsUrl': vcahospitalsUrl,
      'countryCodes': countryCodes,
      'countryCode': countryCode,
      'lifeSpan': lifeSpan,
      'indoor': indoor,
      'lap': lap,
      'altNames': altNames,
      'adaptability': adaptability,
      'affectionLevel': affectionLevel,
      'childFriendly': childFriendly,
      'grooming': grooming,
      'healthIssues': healthIssues,
      'sheddingLevel': sheddingLevel,
      'strangerFriendly': strangerFriendly,
      'vocalisation': vocalisation,
      'experimental': experimental,
      'hairless': hairless,
      'natural': natural,
      'rare': rare,
      'rex': rex,
      'suppressedTail': suppressedTail,
      'shortLegs': shortLegs,
      'hypoallergenic': hypoallergenic,
      'catFriendly': catFriendly,
      'bidability': bidability,
    };
  }
}

class Weight extends Equatable {
  final String? imperial;
  final String? metric;

  const Weight({
    this.imperial,
    this.metric,
  });

  Weight copyWith({
    String? imperial,
    String? metric,
  }) =>
      Weight(
        imperial: imperial ?? this.imperial,
        metric: metric ?? this.metric,
      );

  factory Weight.fromRawJson(String str) => Weight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };

  @override
  List<Object?> get props => [imperial, metric];
}
