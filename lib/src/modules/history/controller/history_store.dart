import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/shared/service/cep_service.dart';
import 'package:fastlocation/src/shared/model/cep_model.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStoreBase with _$HistoryStore;

abstract class _HistoryStoreBase with Store {
  final CepService cepService = CepService();

  @observable
  List<CepModel> historico = [];

  @action
  void carregarHistorico() {
    historico = cepService.recuperarHistorico();
  }
}
