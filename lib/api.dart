
import 'models/user.dart';

class Api {
  Future<void> sensSms(String mobile) async {
    print('发送验证码...');
    await Future.delayed(const Duration(seconds: 1));
    print('发送验证码成功');
  }

  /// 用户登录。简单起见，返回User
  Future<User> login(String mobile, String sms) async {
    print('登录中...');
    await Future.delayed(const Duration(seconds: 1));
    User user = User(id:"1",displayName:  'Rayson Lim',email: "demo@gmail.com",password: "123124",authToken: "123123");
    print('登录成功: $user');
    return user;
  }

}