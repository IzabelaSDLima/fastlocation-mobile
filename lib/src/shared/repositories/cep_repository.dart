import 'package:fastlocation/src/http/dio_client.dart';
import 'package:fastlocation/src/shared/model/cep_model.dart';

class CepRepository {
  final DioClient dioClient = DioClient();

  Future<CepModel> buscarCep(String cep) async {
    final resultado = await dioClient.getCep(cep);
    return CepModel.fromJson(resultado);
  }
}
