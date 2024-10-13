import 'package:fastlocation/src/shared/service/cep_service.dart';
import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/shared/model/cep_model.dart';

part 'cep_store.g.dart';

class CepStore = _CepStoreBase with _$CepStore;

abstract class _CepStoreBase with Store {
  final CepService cepService = CepService();

  @observable
  CepModel? endereco;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> buscarCep(String cep) async {
    try {
      isLoading = true;
      errorMessage = null;

      endereco = await cepService.buscarCep(cep);
    } catch (e) {
      errorMessage = 'Erro ao buscar o CEP: $cep';
    } finally {
      isLoading = false;
    }
  }

  @action
  void carregarUltimoEndereco() {
    var ultimo = cepService.recuperarUltimoEndereco();

    if (ultimo != null) {
      endereco = ultimo;
    }
  }
}
