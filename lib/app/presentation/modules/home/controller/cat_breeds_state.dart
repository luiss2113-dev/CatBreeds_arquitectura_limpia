import 'package:equatable/equatable.dart';

import '../../../../domain/models/breeds.dart';

class CatBreedsState extends Equatable {
  final bool isLoading;
  final String failure;
  final List<Breeds> breeds;
  final Breeds breed;
  final int page;

  const CatBreedsState(
      {this.failure = '',
      this.isLoading = true,
      this.breeds = const [],
      this.breed = const Breeds(),
      this.page = 0});

  CatBreedsState copyWith(
      {bool? isLoading,
      String? failure,
      List<Breeds>? breeds,
      int? page,
      Breeds? breed}) {
    return CatBreedsState(
        isLoading: isLoading ?? this.isLoading,
        failure: failure ?? this.failure,
        breeds: breeds ?? this.breeds,
        breed: breed ?? this.breed,
        page: page ?? this.page);
  }

  @override
  List<Object?> get props => [isLoading, failure, breeds, breed, page];
}
