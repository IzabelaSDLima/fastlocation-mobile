import 'package:fastlocation/src/shared/model/cep_model.dart';
import 'package:fastlocation/src/shared/repositories/cep_repository.dart';
import 'package:fastlocation/src/shared/repositories/local_storage_repository.dart';

class CepService {
  final CepRepository cepRepository = CepRepository();
  final LocalStorageRepository localStorageRepository =
      LocalStorageRepository();

  Future<CepModel> buscarCep(String cep) async {
    final cepModel = await cepRepository.buscarCep(cep);

    localStorageRepository.salvarEndereco(cepModel);

    return cepModel;
  }

  List<CepModel> recuperarHistorico() {
    return localStorageRepository.recuperarEnderecos();
  }

  CepModel? recuperarUltimoEndereco() {
    final List<CepModel> enderecos =
        localStorageRepository.recuperarEnderecos();

    if (enderecos.isNotEmpty) {
      return enderecos.first;
    }

    return null;
  }
}
