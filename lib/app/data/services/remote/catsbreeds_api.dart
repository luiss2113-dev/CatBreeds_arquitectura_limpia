import '../../../domain/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/models/breeds.dart';
import '../../http/http_app.dart';

///Controlador de peticiones a la API a CatsBreeds
class CatBreedsAPI {
  CatBreedsAPI(this._http);

  final HttpApp _http;

  Future<Either<CatsBreedFailure, List<Breeds>>> getList(int page) async {
    final result = await _http.request('/breeds?limit=7&page=$page');
    return result.when(
      (failure) => Either.left(getError(failure)),
      (responseBody) {
        final listBreeds = Breeds.fromListJson(responseBody);
        return Either.right(listBreeds);
      },
    );
  }

  CatsBreedFailure getError(HttpFailure failure) {
    if (failure.statusCode != null) {
      switch (failure.statusCode) {
        case 401:
          return CatsBreedFailure.unauthorized;
        case 500:
          return CatsBreedFailure.serverError;
        default:
          return CatsBreedFailure.unknownError;
      }
    }

    if (failure.exception is NetworkException) {
      return CatsBreedFailure.noInternet;
    }

    return CatsBreedFailure.unknownError;
  }
}
