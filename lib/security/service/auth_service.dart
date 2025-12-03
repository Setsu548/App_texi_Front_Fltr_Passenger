// lib/data/services/auth_service.dart
import 'package:app_texi_passenger/security/models/users_response.dart';
import 'package:dio/dio.dart';
import '../../app/api_dio.dart';
import '../../app/api_response.dart';
import '../models/login_response.dart';
import '../models/send_code_response.dart';

class AuthService {
  final ApiDio _api = ApiDio();

  Future<ApiResponse<LoginResponse>> login(String email, String password, String brand, String model, String os, String ip) async {
    try {
      
      final response = await _api.dio.post(
        '/auth/login',
        data: {'user_name': email, 'country_code': password,"brand": brand, "model": model, "os": os, "ip": ip},
      );

      return ApiResponse<LoginResponse>.fromJson(
        response.data,
        (data) => LoginResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<LogoutResponse>> logout() async {
    try {
      final response = await _api.dio.get(
        '/auth/logout'
      );

      return ApiResponse<LogoutResponse>.fromJson(
        response.data,
        (data) => LogoutResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<SendCodeResponse>> sendCode(SendCode sendCode) async {
    try {
      final response = await _api.dio.post(
        '/auth/send-code',
        data: sendCode.toJson(),
      );

      return ApiResponse<SendCodeResponse>.fromJson(
        response.data,
        (data) => SendCodeResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<UsersResponse>> users(Users users) async {
    try {
      final response = await _api.dio.post(
        '/auth/users',
        data: users.toJson(),
      );

      return ApiResponse<UsersResponse>.fromJson(
        response.data,
        (data) => UsersResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }
}