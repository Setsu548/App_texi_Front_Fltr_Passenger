import 'dart:convert';

class Users {
  final String brand;
  final String email;
  final String first_name;
  final String ip;
  final String model;
  final String os;
  final String profile_picture;
  final String user_name;
  Users({
    required this.brand,
    required this.email,
    required this.first_name,
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
      first_name: first_name ?? this.first_name,
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
      'first_name': first_name,
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
      first_name: map['first_name'] as String,
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
    return 'Users(brand: $brand, email: $email, first_name: $first_name, ip: $ip, model: $model, os: $os, profile_picture: $profile_picture, user_name: $user_name)';
  }

  @override
  bool operator ==(covariant Users other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.email == email &&
      other.first_name == first_name &&
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
      first_name.hashCode ^
      ip.hashCode ^
      model.hashCode ^
      os.hashCode ^
      profile_picture.hashCode ^
      user_name.hashCode;
  }
}

class UsersResponse {
  final String code;
  final String data;
  UsersResponse({
    required this.code,
    required this.data,
  });

  UsersResponse copyWith({
    String? code,
    String? data,
  }) {
    return UsersResponse(
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'data': data,
    };
  }

  factory UsersResponse.fromMap(Map<String, dynamic> map) {
    return UsersResponse(
      code: map['code'] as String,
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromJson(String source) => UsersResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UsersResponse(code: $code, data: $data)';

  @override
  bool operator ==(covariant UsersResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ data.hashCode;
}
