import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  AppEnv._();

  static String get baseUrl => dotenv.env['API_BASE_URL']!;
}
