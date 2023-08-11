import '../../domain/either.dart';
import '../../domain/entities/breeds_entity.dart';
import '../../domain/enums.dart';
import '../../domain/models/breeds.dart';
import '../../domain/repositories/catsbreeds_repository.dart';
import '../services/local/local_db.dart';
import '../services/remote/catsbreeds_api.dart';

class CatsRepositoryImpl implements CatsBreedsRepository {
  final CatBreedsAPI _catBreedsAPI;
  final CatBreedsLocalDataSource _catLocalRepository =
      CatBreedsLocalDataSource();

  CatsRepositoryImpl(this._catBreedsAPI);

  Future<Either<CatsBreedFailure, List<BreedEntity>>> getCatsListRemote(
      int page) async {
    final responseRemote = await _catBreedsAPI.getList(page);
    return responseRemote.when((failure) => Either.left(failure), (data) async {
      await saveCatBreeds(catBreed: data, page: page);
      return Either.right(data);
    });
  }

  @override
  Future<Either<CatsBreedFailure, List<BreedEntity>>> getCatsBreeds(
      int page, bool newData, bool deleteInserts) async {
    if (deleteInserts) {
      await _catLocalRepository.deleteAllCatsBreeds();
    }

    final localBreeds = await getLocalCats();

    if (localBreeds.isEmpty || newData) {
      final newDataList = await getCatsListRemote(page);
      return newDataList.when((failure) => Either.left(failure),
          (breeds) => Either.right([...localBreeds, ...breeds]));
    }
    return Either.right(localBreeds);
  }


  Future<List<BreedEntity>> getLocalCats() async =>
      await _catLocalRepository.getCatsBreeds();

  List<Breeds> _failureOrList(
      Either<CatsBreedFailure, List<Breeds>> failureOrEntities) {
    return failureOrEntities.when((failure) => [], (breeds) => breeds);
  }

  Future<void> saveCatBreeds(
      {required List<Breeds> catBreed, required int page}) async {
    List<BreedEntity> breeds = [];

    if (catBreed.isEmpty) {
      breeds = _failureOrList(await _catBreedsAPI.getList(page));
    } else {
      breeds = catBreed;
    }

    for (BreedEntity entity in breeds) {
      _catLocalRepository.create(entity);
    }
  }
  
  @override
  Future<List<BreedEntity>> seachLocalCats(String matcher) {
    return _catLocalRepository.searchCatBreeds(matcher);
  }
}
