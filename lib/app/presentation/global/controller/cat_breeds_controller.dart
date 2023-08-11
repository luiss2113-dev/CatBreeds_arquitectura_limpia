
import '../../../domain/entities/breeds_entity.dart';
import '../../../domain/enums.dart';
import '../../../domain/repositories/catsbreeds_repository.dart';
import '../../modules/home/controller/cat_breeds_state.dart';
import '../state_notify.dart';

class CatBreedsController extends StateNotify<CatBreedsState> {
  final CatsBreedsRepository catsBreedsRepository;

  CatBreedsController(super.state, {required this.catsBreedsRepository});

  Future<void> getNewCatsbreed() async {
    state = stateCurrent.copyWith(page: stateCurrent.page + 1, isLoading: true);
    await getCateBeerds();
  }

  void filterCats(String matcherWord) async {
    final matchesResult =
        await catsBreedsRepository.seachLocalCats(matcherWord);
    state = stateCurrent.copyWith(
      breeds: matchesResult,
      isLoading: false,
    );
  }

  Future<void> selectBreed(BreedEntity breed) async {
    state = stateCurrent.copyWith(breed: breed);
  }

  Future<void> getCateBeerds({bool deleteInserts = false}) async {
    final response = await catsBreedsRepository.getCatsBreeds(
        stateCurrent.page,
        oldState.page != stateCurrent.page && stateCurrent.breeds.isNotEmpty,
        deleteInserts);

    response.when(
      (failure) {
        state =
            stateCurrent.copyWith(failure: getError(failure), isLoading: false);
      },
      (listBreads) {
        state = stateCurrent.copyWith(
          breeds: listBreads,
          page: deleteInserts ? 0 : stateCurrent.page,
          isLoading: false,
        );
      },
    );
  }

  String getError(CatsBreedFailure failure) {
    return {
          CatsBreedFailure.noData: "No hay datos",
          CatsBreedFailure.noInternet: "No tienes conexión a internet",
          CatsBreedFailure.serverError: "Error en el servidor",
          CatsBreedFailure.unknownError: "Error desconocido",
          CatsBreedFailure.unauthorized: "No autorizado",
        }[failure] ??
        "Error desconocido";
  }
}
