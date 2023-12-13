import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:compasia/config/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../services/auth_service.dart';
import '../logger.dart';
import 'app_exceptions.dart';

class HttpService {
  static void catchErrorHandler(
      {required dynamic error,
      Function(String)? onError,}) {
    logError(error);
    String errorMessage = 'Unknown error occured.';

    if (error is SocketException) {
      errorMessage = 'No internet connection.';
    } else if (error is HttpException) {
      errorMessage = 'HTTP error occured.';
    } else if (error is FormatException) {
      errorMessage = 'Invalid data format.';
    } else if (error is TimeoutException) {
      errorMessage = 'Request timedout.';
    } else if (error is BadRequestException) {
      errorMessage = error.message.toString();
    } else if (error is UnAuthorizedException) {
      errorMessage = error.message.toString();
    } else if (error is NotFoundException) {
      errorMessage = error.message.toString();
    } else if (error is FetchDataException) {
      errorMessage = error.message.toString();
    } else {
      errorMessage = 'Unknown error occured.';
    }

    if (onError != null) {
      onError(errorMessage);
    }
  }

  static void responseErrorhandler({
    required Response response,
    required Function(dynamic) onSuccess,
    Function(String)? onError,
    Function(dynamic)? onEmpty,
    Function(dynamic)? onResponse,
  }) {
    if (onResponse != null) {
      var responseJson = utf8.decode(response.bodyBytes);
      onResponse(jsonDecode(responseJson));
      return;
    }
    debugPrint('response.statusCode ==> ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        if (jsonDecode(response.body)['success'] == true ||
            jsonDecode(response.body)['status'] == "success") {
          onSuccess(jsonDecode(responseJson));
        }
        break;
      case 204:
        if (onEmpty != null) {
          onEmpty({"status": "fail", "message": "No document found"});
        }
        break;

      case 401:
        if (AuthService().isLoggedIn) {
          AuthService().logout();
          if (onError != null) {
            onError(Constants.sessionExpiredDesc);
          }
        }else

        if (onError != null) {
          onError(Constants.unknownError);
        }

        break;
      case 400:
      case 404:
      case 403:
      case 500:
        if (onError != null) {
          onError(jsonDecode(response.body)['message'] ??
              jsonDecode(response.body)['error'] ??
              Constants.unknownError);
        }
        break;
      default:
        if (onError != null) {
          onError(Constants.unknownError);
        }
    }
  }

  static dynamic processResponse(Response response) {
    log('Respone with code :${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        log('Error occured with code :${response.statusCode}');
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
