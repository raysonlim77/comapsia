import 'package:compasia/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/aes_encryption.dart';
import '../models/auth_credential.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const preferencesName = "compasia";
  static const authCredentialKey = '${preferencesName}AuthCredential';
  void setAuthCredential(AuthCredential authCredential) async {
    final encryptedData = AESEncryptData.encryptAES(
        authCredential.toJson(), Constants.encryptionKey);
    if (encryptedData != null) {
      _preferences.setString(authCredentialKey, encryptedData);
    }
  }

  AuthCredential? getAuthCredential() {
    final encryptedAuthCredential = _preferences.getString(authCredentialKey);
    if (encryptedAuthCredential != null) {
      String? decryptedAuthCredential = AESEncryptData.decryptAES(
          encryptedAuthCredential, Constants.encryptionKey);
      if (decryptedAuthCredential != null) {
        return AuthCredential.fromJson(decryptedAuthCredential);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  void removeAuthCredential() async {
    _preferences.remove(authCredentialKey);
  }

  Future<bool> clear() {
    return _preferences.clear();
  }
}
