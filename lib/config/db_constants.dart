import 'package:compasia/config/constants.dart';

enum Environment {
  production,
  localhost,
}

String parseBaseUrl(Environment enviroment) {
  switch (enviroment) {
    case Environment.production:
      return DbConstants.productionBaseUrl;
    case Environment.localhost:
      return DbConstants.localhostBaseUrl;

    default:
      return DbConstants.localhostBaseUrl;
  }
}

class DbConstants {
  static String get baseUrl => parseBaseUrl(Constants.environment);
  static String localhostBaseUrl = "http://192.168.1.251:8080";
  static const String productionBaseUrl = "http://api.joyous.school";
  static const String login = "/api/login";
  static String mobilePhone({String? id}) => "/api/mobile-phone/${id ?? ""}";
  static String mobilePhoneCreateMany = "/api/mobile-phone/create-many";
  static String mobilePhoneGetMany = "/api/mobile-phone/get-many";
}
