import 'dart:convert';

class AuthCredential {
  String? email;
  String? password;
  AuthCredential({
    this.email,
    this.password,
  });

  AuthCredential copyWith({
    String? email,
    String? password,
  }) {
    return AuthCredential(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
  
    return result;
  }

  factory AuthCredential.fromMap(Map<String, dynamic> map) {
    return AuthCredential(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthCredential.fromJson(String source) => AuthCredential.fromMap(json.decode(source));

  @override
  String toString() => 'AuthCredential(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthCredential &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
