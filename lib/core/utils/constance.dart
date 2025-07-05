import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constance {
  static  String baseUrl = dotenv.env['BASE_API_URL'] ?? '';
}