import 'dart:async';

import 'package:http/http.dart' as http;

abstract class AppHttpClient {
  Future<http.Response> get({
    required String method,
    Map<String, String> headers,
    Map<String, String>? query,
    Duration timeout = const Duration(seconds: 30),
    FutureOr<http.Response> Function()? onTimeout,
  });

  Future<http.Response> post({
    required String method,
    required Map<String, String> headers,
    required String body,
    Map<String, String>? query,
    Duration timeout = const Duration(seconds: 30),
    FutureOr<http.Response> Function()? onTimeout,
  });
}
