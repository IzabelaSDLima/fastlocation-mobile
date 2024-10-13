import 'package:hive/hive.dart';
import 'package:fastlocation/src/shared/model/cep_model.dart';

class LocalStorageRepository {
  final Box _box = Hive.box('enderecos');

  void salvarEndereco(CepModel cepModel) {
    _box.put(cepModel.cep, cepModel.toJson());
  }

  List<CepModel> recuperarEnderecos() {
    return _box.values
        .map((e) => CepModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  void removerEndereco(CepModel cepModel) {
    _box.delete(cepModel.cep);
  }
}
