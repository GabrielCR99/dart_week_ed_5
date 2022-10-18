import 'package:get/get.dart';

class RestClient extends GetConnect {
  String projectBaseUrl = 'http://192.168.0.35:8080';

  RestClient() {
    httpClient.baseUrl = projectBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? statusCode;
  final String message;

  const RestClientException(this.message, {this.statusCode});

  @override
  String toString() =>
      'RestClientException(statusCode: $statusCode, message: $message)';
}
