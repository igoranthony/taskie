import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _storage;

  AuthInterceptor({required SecureStorage storage}) : _storage = storage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for login and refresh endpoints
    if (options.path.contains('/auth/login/') || 
        options.path.contains('/auth/refresh/')) {
      return handler.next(options);
    }

    final token = await _storage.getAccessToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired, try refresh
      final refreshToken = await _storage.getRefreshToken();

      if (refreshToken != null) {
        try {
          final response = await _refreshToken(refreshToken);
          final newAccessToken = response.data['access'];

          if (newAccessToken != null) {
            await _storage.saveAccessToken(newAccessToken);

            // Retry original request
            final request = err.requestOptions;
            request.headers['Authorization'] = 'Bearer $newAccessToken';

            final retryDio = Dio();
            final retryResponse = await retryDio.fetch(request);
            return handler.resolve(retryResponse);
          }
        } catch (e) {
          // Refresh failed, clear tokens
          await _storage.clearTokens();
        }
      } else {
        // No refresh token, clear any remaining tokens
        await _storage.clearTokens();
      }
    }

    handler.next(err);
  }

  Future<Response> _refreshToken(String refreshToken) async {
    final dio = Dio();
    dio.options.baseUrl = 'http://192.168.1.3:8000/api';
    
    return await dio.post(
      '/auth/refresh/',
      data: {'refresh': refreshToken},
    );
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'Erro desconhecido';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        message = 'Timeout na conexão. Verifique sua internet.';
        break;
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        switch (statusCode) {
          case 400:
            message = 'Dados inválidos enviados';
            break;
          case 401:
            message = 'Não autorizado. Faça login novamente.';
            break;
          case 403:
            message = 'Acesso negado';
            break;
          case 404:
            message = 'Recurso não encontrado';
            break;
          case 500:
            message = 'Erro interno do servidor';
            break;
          default:
            message = 'Erro do servidor: $statusCode';
        }
        break;
      case DioExceptionType.connectionError:
        message = 'Erro de conexão. Verifique sua internet.';
        break;
      case DioExceptionType.cancel:
        message = 'Requisição cancelada';
        break;
      default:
        message = err.message ?? 'Erro desconhecido';
    }

    // Create a new exception with our custom message
    final customError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      message: message,
    );

    handler.next(customError);
  }
}