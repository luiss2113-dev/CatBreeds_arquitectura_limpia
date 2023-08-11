import '../../../domain/entities/breeds_entity.dart';
import '../../../utils/injections.dart';
import '../../helpers/constants.dart';
import '../../helpers/database_helper.dart';

class CatBreedsLocalDataSource {
  final DatabaseHelper _databaseHelper;
  final String tableName = Constants.catBreedsTableName;

  static final CatBreedsLocalDataSource _breedsLocalDataSource =
      CatBreedsLocalDataSource._internal(getSl());

  factory CatBreedsLocalDataSource() => _breedsLocalDataSource;

  CatBreedsLocalDataSource._internal(this._databaseHelper);

  Future<int> create(BreedEntity catsBreeds) async {
    final db = _databaseHelper;
    try {
      return await db.create(tableName, catsBreeds.toJsonEntity());
    } catch (e, _) {
      return 0;
    }
  }

  deleteAllCatsBreeds() async {
    try {
      return await _databaseHelper.delete(tableName);
    } catch (e, _) {
      return 0;
    }
  }

  Future<List<BreedEntity>> getCatsBreeds() async {
    final db = _databaseHelper;
    try {
      final response = await db.getEntities(tableName);
      return List.generate(
        response.length,
        (index) => BreedEntity.fromJson(response[index]),
      );
    } catch (e, _) {
      return [];
    }
  }

  Future<List<BreedEntity>> searchCatBreeds(String matcher) async {
    final db = _databaseHelper;
    try {
      final response = await db.searchCats(matcher);
      return List.generate(
        response.length,
        (index) => BreedEntity.fromJson(response[index]),
      );
    } catch (e, _) {
      return [];
    }
  }
}
