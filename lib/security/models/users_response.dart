// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Users {
  final String brand;
  final String email;
  final String alias_name;
  final String ip;
  final String model;
  final String os;
  final String profile_picture;
  final String user_name;
  Users({
    required this.brand,
    required this.email,
    required this.alias_name,
    required this.ip,
    required this.model,
    required this.os,
    required this.profile_picture,
    required this.user_name,
  });
  

  Users copyWith({
    String? brand,
    String? email,
    String? first_name,
    String? ip,
    String? model,
    String? os,
    String? profile_picture,
    String? user_name,
  }) {
    return Users(
      brand: brand ?? this.brand,
      email: email ?? this.email,
      alias_name: first_name ?? this.alias_name,
      ip: ip ?? this.ip,
      model: model ?? this.model,
      os: os ?? this.os,
      profile_picture: profile_picture ?? this.profile_picture,
      user_name: user_name ?? this.user_name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'email': email,
      'alias_name': alias_name,
      'ip': ip,
      'model': model,
      'os': os,
      'profile_picture': profile_picture,
      'user_name': user_name,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      brand: map['brand'] as String,
      email: map['email'] as String,
      alias_name: map['alias_name'] as String,
      ip: map['ip'] as String,
      model: map['model'] as String,
      os: map['os'] as String,
      profile_picture: map['profile_picture'] as String,
      user_name: map['user_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Users(brand: $brand, email: $email, alias_name: $alias_name, ip: $ip, model: $model, os: $os, profile_picture: $profile_picture, user_name: $user_name)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.email == email &&
      other.alias_name == alias_name &&
      other.ip == ip &&
      other.model == model &&
      other.os == os &&
      other.profile_picture == profile_picture &&
      other.user_name == user_name;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
      email.hashCode ^
      alias_name.hashCode ^
      ip.hashCode ^
      model.hashCode ^
      os.hashCode ^
      profile_picture.hashCode ^
      user_name.hashCode;
  }
}

class UsersResponse {
  final String token;
  final String status;
  UsersResponse({
    required this.token,
    required this.status,
  });

  UsersResponse copyWith({
    String? token,
    String? status,
  }) {
    return UsersResponse(
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'status': status,
    };
  }

  factory UsersResponse.fromMap(Map<String, dynamic> map) {
    return UsersResponse(
      token: map['token'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromJson(String source) => UsersResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UsersResponse(token: $token, status: $status)';

  @override
  bool operator ==(covariant UsersResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token &&
      other.status == status;
  }

  @override
  int get hashCode => token.hashCode ^ status.hashCode;
}
