
import '../../../domain/enums.dart';
import '../../../domain/models/breeds.dart';
import '../../../domain/repositories/catsbreeds_repository.dart';
import '../../modules/home/controller/cat_breeds_state.dart';
import '../state_notify.dart';

class CatBreedsController extends StateNotify<CatBreedsState> {
  final CatsBreedsRepository catsBreedsRepository;

  CatBreedsController(super.state, {required this.catsBreedsRepository});

  Future<void> getNewCatsbreed() async {
    state = stateCurrent.copyWith(page: stateCurrent.page + 1);
    await getCateBeerds();
  }

  Future<void> selectBreed(Breeds breed) async {
    state = stateCurrent.copyWith(breed: breed);
  }

  Future<void> getCateBeerds() async {
    if (oldState.page == stateCurrent.page && stateCurrent.breeds.isNotEmpty) {
      return;
    }

    final response = await catsBreedsRepository.getCatsList(stateCurrent.page);

    response.when(
      (p0) {
        state = stateCurrent.copyWith(failure: getError(p0));
      },
      (listBreads) {
        state = stateCurrent.copyWith(
          breeds: [...stateCurrent.breeds, ...listBreads],
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
