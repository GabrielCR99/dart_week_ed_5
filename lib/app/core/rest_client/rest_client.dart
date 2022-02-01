import 'package:get/get.dart';

class RestClient extends GetConnect {
  String projectBaseUrl = 'http://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = projectBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? statusCode;
  final String message;

  RestClientException(this.message, {this.statusCode});

  @override
  String toString() =>
      'RestClientException(statusCode: $statusCode, message: $message)';
}
