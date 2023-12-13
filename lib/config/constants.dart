import 'db_constants.dart';

class Constants {
  static const Environment environment = Environment.production;
  static const String encryptionKey = '6PqUC1dMo68grREFTvwbq4PMkh2MOVrE';
  static String get noDataFound => 'No Data Found';
  static String get success => 'Success';
  static String get fail => 'Fail';
  static String get unknownError => 'Oops, Something went Wrong!';
  static String get sessionExpiredDesc =>
      'Your session has expired. Please log in again to continue.';
  static String get authenticationFailedDesc =>
      'Authentication failed. Please check your credentials and try again.';
}
