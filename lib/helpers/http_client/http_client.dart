import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../config/db_constants.dart';
import '../logger.dart';
import 'http_service.dart';

class HttpClient {
  static int timeOutDuration = 15;
  static Uri apiEndpoint(String endpoint) {
    String url = DbConstants.baseUrl + endpoint;

    return Uri.parse(url);
  }

  static Future<void> get({
    String? endpoint,
    String? url,
    dynamic body,
    Map<String, String>? parameters,
    Map<String, String>? headers,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
    Function(dynamic data)? onResponse,
    bool isRethrowRequired = false,
  }) async {
    var uri = url != null
        ? Uri.parse(url).replace(queryParameters: parameters)
        : Uri.parse("${DbConstants.baseUrl}$endpoint")
            .replace(queryParameters: parameters);

    log("Get Method:$uri ==> Body: ${json.encode(body, toEncodable: isoDateEncoder)}");
    try {
      Map<String, String>? newHeaders =
          headers ?? {'Content-Type': 'application/json; charset=UTF-8'};

      http.Request request = http.Request('GET', uri);

      for (var element in newHeaders.keys) {
        request.headers[element] = newHeaders[element]!;
      }

      if (body != null) {
        request.body = json.encode(body, toEncodable: isoDateEncoder);
      }
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse)
          .timeout(Duration(seconds: timeOutDuration));
      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => $responseJson");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onError: onError,
        onResponse: onResponse,
      );
    } on SocketException catch (error) {
      logError(error);
      if (isRethrowRequired) {
        rethrow;
      }
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }

  static Future<void> post({
    String? endpoint,
    String? url,
    required dynamic body,
    Map<String, String>? headers,
    required Function(dynamic) onSuccess,
    Function(dynamic)? onEmpty,
    Function(String)? onError,
    bool isRethrowRequired = false,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : endpoint != null
            ? apiEndpoint(endpoint)
            : Uri.parse("");
    log("Post Method:$uri ==> Body: ${json.encode(body, toEncodable: isoDateEncoder)}");
    try {
      var response = await http
          .post(
            uri,
            headers:
                headers ?? {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(body, toEncodable: isoDateEncoder),
          )
          .timeout(Duration(seconds: timeOutDuration));

      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => $responseJson");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onEmpty: onEmpty,
        onError: onError,
      );
    } on SocketException catch (error) {
      logError(error);
      if (isRethrowRequired) {
        rethrow;
      }
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }

  static Future<void> put({
    String? endpoint,
    String? url,
    required dynamic body,
    Map<String, String>? headers,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : endpoint != null
            ? apiEndpoint(endpoint)
            : Uri.parse("");
    log("Put Method:$uri ==> Body: ${json.encode(body, toEncodable: isoDateEncoder)}");
    try {
      var response = await http
          .put(
            uri,
            headers:
                headers ?? {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(body, toEncodable: isoDateEncoder),
          )
          .timeout(Duration(seconds: timeOutDuration));
      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => ${jsonDecode(responseJson)}");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }

  static Future<void> patch({
    String? endpoint,
    String? url,
    required dynamic body,
    Map<String, String>? headers,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : endpoint != null
            ? apiEndpoint(endpoint)
            : Uri.parse("");
    log("Patch Method:$uri ==> Body:${json.encode(body, toEncodable: isoDateEncoder)}");
    try {
      var response = await http
          .patch(
            uri,
            headers:
                headers ?? {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(body, toEncodable: isoDateEncoder),
          )
          .timeout(Duration(seconds: timeOutDuration));
      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => ${jsonDecode(responseJson)}");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }

  static Future<void> delete({
    String? endpoint,
    String? url,
    required dynamic body,
    Map<String, String>? headers,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : endpoint != null
            ? apiEndpoint(endpoint)
            : Uri.parse("");
    log("Delete Method:$uri ==> Body:${json.encode(body, toEncodable: isoDateEncoder)}");
    try {
      var response = await http
          .delete(
            uri,
            headers:
                headers ?? {'Content-Type': 'application/json; charset=UTF-8'},
            body: json.encode(body, toEncodable: isoDateEncoder),
          )
          .timeout(Duration(seconds: timeOutDuration));
      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => ${jsonDecode(responseJson)}");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }

  static Future<void> multipartPost({
    String? url,
    String? endpoint,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    List<File>? files,
    String? filesKey,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
  }) async {
    final uri = url != null
        ? Uri.parse(url)
        : endpoint != null
            ? apiEndpoint(endpoint)
            : Uri.parse("");
    log("multipartPost Method:$uri ==> Body:$body");

    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      if (headers != null) {
        for (var element in headers.keys) {
          request.headers[element] = headers[element]!;
        }
      }
      if (body != null) {
        for (var element in body.keys) {
          request.fields[element] = body[element].toString();
        }
      }
      if (filesKey != null && files != null) {
        List<http.MultipartFile> newList = [];
        for (int i = 0; i < files.length; i++) {
          File file = files[i];

          Uint8List? imageData;
          if (kIsWeb) {
            http.Response response = await http.get(
              Uri.parse(file.path),
            );
            imageData = response.bodyBytes;
          }

          http.MultipartFile? multipartFile;
          if (kIsWeb && imageData != null) {
            multipartFile = http.MultipartFile.fromBytes(filesKey, imageData,
                filename: basename(file.path));
          }
          if (!kIsWeb) {
            multipartFile = await http.MultipartFile.fromPath(
              filesKey,
              file.path,
            );
          }
          if (multipartFile != null) newList.add(multipartFile);
        }
        request.files.addAll(newList);
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var responseJson = utf8.decode(response.bodyBytes);
      log("${endpoint ?? url} Response => $responseJson");

      HttpService.responseErrorhandler(
        response: response,
        onSuccess: onSuccess,
        onError: onError,
      );
    } catch (e) {
      HttpService.catchErrorHandler(
        error: e,
        onError: onError,
      );
    }
  }
}

dynamic isoDateEncoder(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}
