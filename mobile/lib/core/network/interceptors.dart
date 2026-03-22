import 'package:dio/dio.dart';
import '../storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _storage;
  final Dio _dio;
  final String _baseUrl;
  final void Function()? onLogout;

  AuthInterceptor({
    required SecureStorage storage,
    required Dio dio,
    required String baseUrl,
    this.onLogout,
  })  : _storage = storage,
        _dio = dio,
        _baseUrl = baseUrl;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
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
    // Avoid infinite loop: don't retry if this is already a retry
    if (err.response?.statusCode == 401 &&
        err.requestOptions.extra['_retry'] != true) {
      final refreshToken = await _storage.getRefreshToken();

      if (refreshToken != null) {
        try {
          final refreshDio = Dio(BaseOptions(baseUrl: _baseUrl));
          final response = await refreshDio.post(
            '/auth/refresh/',
            data: {'refresh': refreshToken},
          );
          final newAccessToken = response.data['access'];

          if (newAccessToken != null) {
            await _storage.saveAccessToken(newAccessToken);

            final request = err.requestOptions;
            request.headers['Authorization'] = 'Bearer $newAccessToken';
            request.extra['_retry'] = true;

            final retryResponse = await _dio.fetch(request);
            return handler.resolve(retryResponse);
          }
        } catch (_) {
          await _storage.clearTokens();
          onLogout?.call();
        }
      }
    }

    handler.next(err);
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

    final customError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      message: message,
    );

    handler.next(customError);
  }
}
