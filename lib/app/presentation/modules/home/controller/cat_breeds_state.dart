import 'package:equatable/equatable.dart';

import '../../../../domain/entities/breeds_entity.dart';
import '../../../../domain/models/breeds.dart';

class CatBreedsState extends Equatable {
  final bool isLoading;
  final String failure;
  final List<BreedEntity> breeds;
  final List<BreedEntity> copyBreeds;
  final BreedEntity breed;
  final int page;

  const CatBreedsState(
      {this.failure = '',
      this.isLoading = true,
      this.breeds = const [],
      this.copyBreeds = const [],
      this.breed = const Breeds(),
      this.page = 0});

  List<BreedEntity> get filterCatBreeds => copyBreeds;

  CatBreedsState copyWith(
      {bool? isLoading,
      String? failure,
      List<BreedEntity>? breeds,
      List<BreedEntity>? copyBreeds,
      int? page,
      BreedEntity? breed}) {
    return CatBreedsState(
        isLoading: isLoading ?? this.isLoading,
        failure: failure ?? this.failure,
        breeds: breeds ?? this.breeds,
        breed: breed ?? this.breed,
        page: page ?? this.page,
        copyBreeds: copyBreeds ?? this.copyBreeds);
  }

  @override
  List<Object?> get props =>
      [isLoading, failure, breeds, breed, page, copyBreeds];
}
