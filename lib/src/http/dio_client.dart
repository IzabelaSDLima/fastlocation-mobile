import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://viacep.com.br/ws',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  Future<Map<String, dynamic>> getCep(String cep) async {
    try {
      final response = await _dio.get('/$cep/json/');
      return response.data;
    } catch (e) {
      throw Exception('Erro ao buscar o CEP: $e');
    }
  }
}
