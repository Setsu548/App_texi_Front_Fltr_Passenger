// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendCodeResponse {
  final int type_user_id;
  final bool is_verified;
  final String status;
  final String message;
  SendCodeResponse({
    required this.type_user_id,
    required this.is_verified,
    required this.status,
    required this.message,
  });

  SendCodeResponse copyWith({
    int? type_user_id,
    bool? is_verified,
    String? status,
    String? message,
  }) {
    return SendCodeResponse(
      type_user_id: type_user_id ?? this.type_user_id,
      is_verified: is_verified ?? this.is_verified,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type_user_id': type_user_id,
      'is_verified': is_verified,
      'status': status,
      'message': message,
    };
  }

  factory SendCodeResponse.fromMap(Map<String, dynamic> map) {
    return SendCodeResponse(
      type_user_id: map['type_user_id'] as int,
      is_verified: map['is_verified'] as bool,
      status: map['status'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendCodeResponse.fromJson(String source) => SendCodeResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SendCodeResponse(type_user_id: $type_user_id, is_verified: $is_verified, status: $status, message: $message)';
  }

  @override
  bool operator ==(covariant SendCodeResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.type_user_id == type_user_id &&
      other.is_verified == is_verified &&
      other.status == status &&
      other.message == message;
  }

  @override
  int get hashCode {
    return type_user_id.hashCode ^
      is_verified.hashCode ^
      status.hashCode ^
      message.hashCode;
  }
}

class SendCode {
  final String brand;
  final String ip;
  final String os;
  final String model;
  final String phone_number;
  final int verification_code;
  SendCode({
    required this.brand,
    required this.ip,
    required this.os,
    required this.model,
    required this.phone_number,
    required this.verification_code,
  });

  SendCode copyWith({
    String? brand,
    String? ip,
    String? os,
    String? model,
    String? phone_number,
    int? verification_code,
  }) {
    return SendCode(
      brand: brand ?? this.brand,
      ip: ip ?? this.ip,
      os: os ?? this.os,
      model: model ?? this.model,
      phone_number: phone_number ?? this.phone_number,
      verification_code: verification_code ?? this.verification_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'ip': ip,
      'os': os,
      'model': model,
      'phone_number': phone_number,
      'verification_code': verification_code,
    };
  }

  factory SendCode.fromMap(Map<String, dynamic> map) {
    return SendCode(
      brand: map['brand'] as String,
      ip: map['ip'] as String,
      os: map['os'] as String,
      model: map['model'] as String,
      phone_number: map['phone_number'] as String,
      verification_code: map['verification_code'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendCode.fromJson(String source) => SendCode.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SendCode(brand: $brand, ip: $ip, os: $os, model: $model, phone_number: $phone_number, verification_code: $verification_code)';
  }

  @override
  bool operator ==(covariant SendCode other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.ip == ip &&
      other.os == os &&
      other.model == model &&
      other.phone_number == phone_number &&
      other.verification_code == verification_code;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
      ip.hashCode ^
      os.hashCode ^
      model.hashCode ^
      phone_number.hashCode ^
      verification_code.hashCode;
  }
}
