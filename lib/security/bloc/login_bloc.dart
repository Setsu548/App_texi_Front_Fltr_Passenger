import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../app/secure_storage.dart';
import '../models/send_code_response.dart';
import '../models/users_response.dart';
import '../service/auth_service.dart';
part 'login_bloc.freezed.dart';


// 📦 Estados
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    String? token,
    @Default(null) String? nombre,
    @Default(null) String? ci,
    @Default(null) String? telefono,
    @Default(null) String? email,
    @Default(null) String? categoria,
    @Default(null) String? uuid,
    @Default(null) String? cartId,
    @Default(false) bool? loadingListVehicle,
    @Default(null) int? typeUserId,
    @Default(null) String? status,
    @Default(null) String? userName,
    @Default(null) bool? isVerified,
    @Default(null) double? latInit,
    @Default(null) double? lngInit,
    @Default(null) double? latFin,
    @Default(null) double? lngFin,
    @Default(null) double? currentlat,
    @Default(null) double? currentFin,
    @Default(null) String? originTime,
    @Default(null) String? originDescription,
    @Default(null) String? destinationDescription,
    @Default(null) double? distance,
    @Default(null) double? earnings
  }) = _LoginState;
}

// 📦 Eventos
@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initial() = _InitialEvent;
  const factory LoginEvent.loginInit({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required String userName,required String password}) = _LoginInitEvent;
  const factory LoginEvent.logout({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error}) = _LogoutEvent;
  const factory LoginEvent.sendCode({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error, required SendCode sendCode}) = _SendCodeEvent;
  const factory LoginEvent.users({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error, required Users users}) = _UsersEvent;
  const factory LoginEvent.saveRoutes({required double latInit,required double lngInit,
  required double latFin,required double lngFin,
  required double currentlat,required double currentFin,
  required String originTime,required String originDescription,
  required String destinationDescription,required double distance,
  required double earnings}) = _SaveRoutesEvent;
}

// 🧠 Bloc principal
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await event.map(
          initial: (event) async => _initial(event, emit),
          loginInit: (event) async => _loginInit(event, emit),
          logout: (event) async => _logout(event, emit),
          sendCode: (event) async => _sendCode(event, emit),
          users: (event) async => _users(event, emit),
          saveRoutes: (event) async => _saveRoutes(event, emit),
        );
      },
    );
  }
  
  

  Future<void> _initial(_InitialEvent event, Emitter<LoginState> emit) async {
    
  }
  Future<void> _saveRoutes(_SaveRoutesEvent event, Emitter<LoginState> emit) async {
    emit(
            state.copyWith(
              latInit:event.latInit,
              lngInit:event.lngInit,
              latFin:event.latFin,
              lngFin:event.lngFin,
              currentlat:event.currentlat,
              currentFin:event.currentFin,
              originTime: event.originTime,
              originDescription: event.originDescription,
              destinationDescription: event.destinationDescription,
              distance: event.distance,
              earnings: event.earnings,
            ),
          );
  }

  Future<void> _logout(_LogoutEvent event, Emitter<LoginState> emit) async {
    try {
      final res = await authService.logout();

        if (res.success) {
          print('✅ ${res.message}');
          SecureTokenStorage.clearToken();

          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
    } catch (e) {
      event.error!(e);
    }
  }
  Future<void> _loginInit(_LoginInitEvent event, Emitter<LoginState> emit) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      event.befor!('');
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        final res = await authService.login(event.userName,event.password,androidInfo.brand,androidInfo.model,'Android ${androidInfo.version.release}','');

        if (res.success) {
          print('✅ ${res.message}');
          // print('🔑 Token: ${res.data?.code}');
          emit(
            state.copyWith(
              userName: event.password + event.userName,
              typeUserId: res.data?.type_user_id,
              status: res.data?.status,
              isVerified: res.data?.is_verified,
            ),
          );
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        final res = await authService.login(event.userName,event.password,iosInfo.utsname.machine,iosInfo.model,'iOS ${iosInfo.systemVersion}','');
        if (res.success) {
          print('✅ ${res.message}');
          emit(
            state.copyWith(
              userName: event.password + event.userName,
              typeUserId: res.data?.type_user_id,
              status: res.data?.status,
              isVerified: res.data?.is_verified,
              
            ),
          );
          event.success!(res);
          // print('🔑 Token: ${res.data?.code}');
        } else {
          event.error!(res);
          print('⚠️ Error: ${res.message}');
        }
      }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }

  Future<void> _sendCode(_SendCodeEvent event, Emitter<LoginState> emit) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      event.befor!('');
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        final sendCode = SendCode(
          brand: androidInfo.brand, 
          model: androidInfo.model,
          os: 'Android ${androidInfo.version.release}', 
          phone_number: state.userName!,
          ip: '',
          verification_code: event.sendCode.verification_code);
        final res = await authService.sendCode(sendCode);
        if (res.success) {
          print('✅ ${res.message}');

          // print('🔑 Token: ${res.data?.code}');
          // SecureTokenStorage.saveToken(res.data!.code);
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        final sendCode = SendCode(
          brand: iosInfo.utsname.machine, 
          ip: '', 
          model: iosInfo.model,
          os: 'iOS ${iosInfo.systemVersion}', 
          phone_number: event.sendCode.phone_number, 
          verification_code: 0);
        final res = await authService.sendCode(sendCode);
        if (res.success) {
          print('✅ ${res.message}');
          // SecureTokenStorage.saveToken(res.data!.code);
          // event.success!(res);
          // print('🔑 Token: ${res.data?.code}');
        } else {
          event.error!(res);
          print('⚠️ Error: ${res.message}');
        }
      }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }

  Future<void> _users(_UsersEvent event, Emitter<LoginState> emit) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      event.befor!('');
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        final users = Users(
          brand: androidInfo.brand, 
          email: event.users.email, 
          full_name: event.users.full_name, 
          ip: '', model: event.users.model, 
          os: 'Android ${androidInfo.version.release}', 
          profile_picture: event.users.profile_picture, 
          user_name: state.userName!);
        final res = await authService.users(users);
        if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data?.token}');
          SecureTokenStorage.saveToken(res.data!.token);
          emit(
            state.copyWith(
              status: res.data?.status,
            ),
          );
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        final users = Users(
          brand: iosInfo.utsname.machine, 
          email: event.users.email, 
          full_name: event.users.full_name, 
          ip: '', model: event.users.model, 
          os: 'iOS ${iosInfo.systemVersion}', 
          profile_picture: event.users.profile_picture, 
          user_name: event.users.user_name
        );
        final res = await authService.users(users);
        if (res.success) {
          print('✅ ${res.message}');
          SecureTokenStorage.saveToken(res.data!.token);
          emit(
            state.copyWith(
              status: res.data?.status,
            ),
          );
          event.success!(res);
          print('🔑 Token: ${res.data?.token}');
        } else {
          event.error!(res);
          print('⚠️ Error: ${res.message}');
        }
      }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }
}