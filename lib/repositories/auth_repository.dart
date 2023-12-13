import '../config/db_constants.dart';
import '../helpers/http_client/http_client.dart';
import '../models/auth_credential.dart';
import '../models/user.dart';
import '../services/share_preferences_service.dart';

class AuthRepository {
  static Future<User?> cachedLogin({
    Function(User)? onSuccess,
  }) async {
    SharedPreferencesService sharedPreferencesService =
        SharedPreferencesService();

    try {
      AuthCredential? cachedAuthCredential =
          sharedPreferencesService.getAuthCredential();
      if (cachedAuthCredential == null) return null;

      return await loginWithEmail(
        email: cachedAuthCredential.email!,
        password: cachedAuthCredential.password!,
      );
    } catch (e) {
      return null;
    }

  }

  static Future<User?> loginWithEmail(
      {required String email,
      required String password,
      Function(String)? onError,
      }) async {
    User? user;
    await HttpClient.post(
        endpoint: DbConstants.login,
        body: {
          "email": email,
          "password": password,
          "authProviderType": "email"
        },
        onError: onError,
        onSuccess: (data) {
              SharedPreferencesService sharedPreferencesService =
        SharedPreferencesService();
          AuthCredential authCredential = AuthCredential(
              email: email,
              password: password);
          sharedPreferencesService.setAuthCredential(authCredential);
          user = User.fromMap(data["data"]);
        });

    return user;
  }
}
