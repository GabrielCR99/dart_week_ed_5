import 'package:get/get.dart';

class RestClient extends GetConnect {
  String projectBaseUrl = 'https://vakinhaburger-roveri.cloudns.ph';

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
