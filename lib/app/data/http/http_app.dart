import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../domain/either.dart';

//inclusi[on] de archivo
part 'failure.dart';
part 'logs.dart';
part 'method.dart';
part 'parse_response_body.dart';

///Clase para control de respuestas, seguimientos de errores y logs
class HttpApp {
  final Client _client;
  final String _baseUrl;
  final String _apiKey;

  HttpApp({
    required Client client,
    required String baseUrl,
    required String apiKey,
  })  : _client = client,
        _baseUrl = baseUrl,
        _apiKey = apiKey;

  Future<Either<HttpFailure, String>> request(
    String path, {
    HttpRequest method = HttpRequest.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
  }) async {
    Map<String, dynamic> logs = {};
    StackTrace? stackTrace;
    try {
      Uri url = Uri.parse(path.startsWith('http') ? path : '$_baseUrl$path');

      if (queryParameters.isNotEmpty) {
        url = url.replace(queryParameters: queryParameters);
      }

      headers = {
        'Content-Type': 'application/json',
        'x-api-key': _apiKey,
        ...headers
      };

      late final Response response;

      logs = {
        'headers': headers,
        'startTime': DateTime.now().toString(),
        'method': method.name,
        'queryParameters': queryParameters,
        'url': url.toString()
      };

      switch (method) {
        case HttpRequest.get:
          response = await _client.get(url, headers: headers);
          break;
        case HttpRequest.post:
          response = await _client.post(
            url,
            headers: headers,
            body: queryParameters,
          );
          break;

        case HttpRequest.put:
          response = await _client.put(
            url,
            headers: headers,
            body: queryParameters,
          );
          break;

        case HttpRequest.delete:
          response = await _client.delete(
            url,
            headers: headers,
          );
          break;
      }
      final statusCode = response.statusCode;

      logs = {
        ...logs,
        'statusCode': statusCode,
        'body': _parseResponseBody(response.body),
      };

      if (statusCode >= 200 && statusCode < 300) {
        return Either.right(response.body);
      } else {
        return Either.left(HttpFailure(statusCode: statusCode));
      }
    } catch (e, s) {
      stackTrace = s;
      logs = {
        ...logs,
        'exception': e.runtimeType.toString(),
        'stackTrace': stackTrace.toString(),
      };

      if (e is ClientException || e is SocketException) {
        logs = {
          ...logs,
          'exception': 'NetworkException',
        };
        return Either.left(HttpFailure(exception: NetworkException));
      }

      return Either.left(HttpFailure(exception: e));
    } finally {
      _printLogs(logs, stackTrace);
    }
  }
}
