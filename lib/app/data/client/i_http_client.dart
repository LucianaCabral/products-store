
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get({required String url});
}

