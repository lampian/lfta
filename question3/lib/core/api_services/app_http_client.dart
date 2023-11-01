import 'dart:async';

import 'package:http/http.dart' as http;

import 'app_http_client_impl.dart';

class HttpClientImpl implements AppHttpClient {
  final String baseUrl;
  final client = http.Client();
  HttpClientImpl(this.baseUrl);
  @override
  Future<http.Response> get({
    required String method,
    Map<String, String> headers = const {},
    Map<String, String>? query,
    Duration timeout = const Duration(seconds: 30),
    FutureOr<http.Response> Function()? onTimeout,
  }) async {
    final String completeUrl = urlForResource(
      baseUrl: baseUrl,
      method: method,
      query: query,
    );

    final result = await client
        .get(Uri.parse(completeUrl), headers: headers)
        .timeout(timeout, onTimeout: onTimeout);

    return result;
  }

  @override
  Future<http.Response> post({
    required String method,
    Map<String, String> headers = const {},
    required String body,
    Map<String, String>? query,
    Duration timeout = const Duration(seconds: 30),
    FutureOr<http.Response> Function()? onTimeout,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  String urlForResource({
    required String baseUrl,
    required String method,
    Map<String, String>? query,
  }) {
    query ??= <String, String>{};

    var url = baseUrl;
    if (!url.endsWith('/')) {
      url += '/';
    }

    if (query.isEmpty) {
      return url + method;
    }

    final String queryString =
        query.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
    return '$url$method?$queryString';
  }
}
