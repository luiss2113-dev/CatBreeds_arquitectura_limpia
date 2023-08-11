import '../either.dart';
import '../enums.dart';
import '../models/breeds.dart';

///Declaraci[on] de m[e]tedos de CatsBreedsRepository para utilizaci[on] con provider
abstract class CatsBreedsRepository {
  Future<Either<CatsBreedFailure, List<Breeds>>> getCatsList(int page);
}
