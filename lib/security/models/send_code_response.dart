// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SendCodeResponse {
  final String code;
  final String data;
  SendCodeResponse({
    required this.code,
    required this.data,
  });

  SendCodeResponse copyWith({
    String? code,
    String? data,
  }) {
    return SendCodeResponse(
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

  factory SendCodeResponse.fromMap(Map<String, dynamic> map) {
    return SendCodeResponse(
      code: map['code'] as String,
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendCodeResponse.fromJson(String source) => SendCodeResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SendCodeResponse(code: $code, data: $data)';

  @override
  bool operator ==(covariant SendCodeResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.code == code &&
      other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ data.hashCode;
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
