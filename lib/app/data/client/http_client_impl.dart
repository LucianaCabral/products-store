import 'package:http/http.dart' as http;
import 'i_http_client.dart';

class HttpClientImpl implements IHttpClient {
  final http.Client client = http.Client();

  @override
  Future <http.Response> get({required String url}) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Falha na requisição: ${response.statusCode}');
    }
  }
}

