// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// lib/data/models/login_response.dart
class LoginResponse {
  final String code;
  final int type_user_id;
  final bool is_verified;
  final String status;
  final String message;
  LoginResponse({
    required this.code,
    required this.type_user_id,
    required this.is_verified,
    required this.status,
    required this.message,
  });
  

  LoginResponse copyWith({
    String? code,
    int? type_user_id,
    bool? is_verified,
    String? status,
    String? message,
  }) {
    return LoginResponse(
      code: code ?? this.code,
      type_user_id: type_user_id ?? this.type_user_id,
      is_verified: is_verified ?? this.is_verified,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'type_user_id': type_user_id,
      'is_verified': is_verified,
      'status': status,
      'message': message,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      code: map['code'] as String,
      type_user_id: map['type_user_id'] as int,
      is_verified: map['is_verified'] as bool,
      status: map['status'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginResponse(code: $code, type_user_id: $type_user_id, is_verified: $is_verified, status: $status, message: $message)';
  }

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.type_user_id == type_user_id &&
      other.is_verified == is_verified &&
      other.status == status &&
      other.message == message;
  }

  @override
  int get hashCode {
    return code.hashCode ^
      type_user_id.hashCode ^
      is_verified.hashCode ^
      status.hashCode ^
      message.hashCode;
  }
}

class LogoutResponse {
  final String data;

  LogoutResponse({required this.data,});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      data: json['data'] ?? '',
    );
  }
}
// class User {
//   final int id;
//   final String name;
//   final String email;

//   User({required this.id, required this.name, required this.email});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//     );
//   }
// }
