import '../either.dart';
import '../entities/breeds_entity.dart';
import '../enums.dart';

///Declaraci[on] de m[e]tedos de CatsBreedsRepository para utilizaci[on] con provider
abstract class CatsBreedsRepository {
  Future<Either<CatsBreedFailure, List<BreedEntity>>> getCatsBreeds(int page, bool newData, bool deleteInserts);
  Future<List<BreedEntity>> seachLocalCats(String matcher);

}
