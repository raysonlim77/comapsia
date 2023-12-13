import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String displayName;
  final String authToken;
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.displayName,
    required this.authToken,
  });

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? displayName,
    String? authToken,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
      authToken: authToken ?? this.authToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'displayName': displayName});
    result.addAll({'authToken': authToken});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      displayName: map['displayName'] ?? '',
      authToken: map['authToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, password: $password, displayName: $displayName, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.id == id &&
      other.email == email &&
      other.password == password &&
      other.displayName == displayName &&
      other.authToken == authToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      email.hashCode ^
      password.hashCode ^
      displayName.hashCode ^
      authToken.hashCode;
  }
}
