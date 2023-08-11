import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/models/breeds.dart';
import '../../domain/repositories/catsbreeds_repository.dart';
import '../services/remote/catsbreeds_api.dart';

class CatsRepositoryImpl implements CatsBreedsRepository {
  final CatBreedsAPI _catBreedsAPI;

  CatsRepositoryImpl(this._catBreedsAPI);

  @override
  Future<Either<CatsBreedFailure, List<Breeds>>> getCatsList(int page) async {
    return _catBreedsAPI.getList(page);
  }
}
