import 'package:dio/dio.dart';

class AppErrorParser {
  AppErrorParser._();

  static String parse(dynamic error) {
    if (error is DioException) {
      final data = error.response?.data;

      if (data is Map) {
        // {"detail": "mensagem"}
        if (data.containsKey('detail')) {
          return data['detail'].toString();
        }
        // {"campo": ["mensagem"]} — pega o primeiro erro de qualquer campo
        for (final value in data.values) {
          if (value is List && value.isNotEmpty) return value.first.toString();
          if (value is String && value.isNotEmpty) return value;
        }
      }

      // Mensagem já tratada pelo ErrorInterceptor (timeout, conexão, etc.)
      if (error.message != null && error.message!.isNotEmpty) {
        return error.message!;
      }
    }

    return 'Ocorreu um erro inesperado. Tente novamente.';
  }
}
