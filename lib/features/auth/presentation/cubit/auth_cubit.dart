import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/core/exceptions/app_exception.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/login/login_resend_otp_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/login/login_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/login/login_verify_otp_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/password_reset/password_reset_confirm_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/password_reset/password_reset_resend_otp_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/password_reset/password_reset_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/register/register_resend_otp_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/register/register_use_case.dart';
import 'package:sijil_patient_portal/domain/use_cases/auth/register/register_verify_otp_use_case.dart';
import 'package:sijil_patient_portal/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  RegisterUseCase registerUseCase;
  RegisterResendOtpUseCase registerResendOtpUseCase;
  RegisterVerifyOtpUseCase registerVerifyOtpUseCase;
  LoginUseCase loginUseCase;
  LoginResendOtpUseCase loginResendOtpUseCase;
  LoginVerifyOtpUseCase loginVerifyOtpUseCase;
  PasswordResetUseCase passwordResetUseCase;
  PasswordResetResendOtpUseCase passwordResetResendOtpUseCase;
  PasswordResetConfirmUseCase passwordResetConfirmUseCase;

  AuthCubit({
    required this.registerUseCase,
    required this.registerResendOtpUseCase,
    required this.registerVerifyOtpUseCase,
    required this.loginUseCase,
    required this.loginResendOtpUseCase,
    required this.loginVerifyOtpUseCase,
    required this.passwordResetUseCase,
    required this.passwordResetResendOtpUseCase,
    required this.passwordResetConfirmUseCase,
  }) : super(AuthIntialState());
  String? gender;

  void changeSelectGender(String? val) {
    gender = val;
    emit(ChangeSelectGenderState());
  }

  void register({required RegisterRequest registerRequest}) async {
    try {
      emit(RegisterLoadingState());
      var registerResponse = await registerUseCase.invoke(
        registerRequest: registerRequest,
      );
      emit(RegisterSccessState(registerResponse: registerResponse));
    } on AppException catch (e) {
      emit(RegisterErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(RegisterErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void registerResendOtp({
    required RegisterResendOtpRequest registerResendOtpRequest,
  }) async {
    try {
      emit(RegisterResndOtpLoadingState());
      var registerResendOtpResponse = await registerResendOtpUseCase.invoke(
        registerResendOtpRequest: registerResendOtpRequest,
      );
      emit(
        RegisterResndOtpSccessState(
          registerResendOtpResponse: registerResendOtpResponse,
        ),
      );
    } on AppException catch (e) {
      emit(RegisterResndOtpErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(RegisterResndOtpErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void registerVerifyOtp({
    required RegisterVerifyOtpRequest registerVerifyOtpRequest,
  }) async {
    try {
      emit(RegisterVerifyOtpLoadingState());
      var registerVerifyOtpResponse = await registerVerifyOtpUseCase.invoke(
        registerVerifyOtpRequest: registerVerifyOtpRequest,
      );
      emit(
        RegisterVerifyOtpSccessState(
          registerVerifyOtpResponse: registerVerifyOtpResponse,
        ),
      );
    } on AppException catch (e) {
      emit(RegisterVerifyOtpErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(RegisterVerifyOtpErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void login({required LoginRequest loginRequest}) async {
    try {
      emit(LoginLoadingState());
      var loginResponse = await loginUseCase.invoke(loginRequest: loginRequest);
      emit(LoginSccessState(loginResponse: loginResponse));
    } on AppException catch (e) {
      emit(LoginErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(LoginErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void loginResendOtp({
    required LoginResendOtpRequest loginResendOtpRequest,
  }) async {
    try {
      emit(LoginResendOtpLoadingState());
      var loginResendOtpResponse = await loginResendOtpUseCase.invoke(
        loginResendOtpRequest: loginResendOtpRequest,
      );
      emit(
        LoginResendOtpSccessState(
          loginResendOtpResponse: loginResendOtpResponse,
        ),
      );
    } on AppException catch (e) {
      emit(LoginResendOtpErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(LoginResendOtpErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void loginVerifyOtp({
    required LoginVerfiyOtpRequest loginVerfiyOtpRequest,
  }) async {
    try {
      emit(LoginVerifyOtpLoadingState());
      var loginVerfiyOtpResponse = await loginVerifyOtpUseCase.invoke(
        loginVerfiyOtpRequest,
      );
      emit(
        LoginVerifyOtpSccessState(
          loginVerifyOtpResponse: loginVerfiyOtpResponse,
        ),
      );
    } on AppException catch (e) {
      emit(LoginVerifyOtpErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(LoginVerifyOtpErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void passwordReset({
    required PasswordResetRequest passwordResetRequest,
  }) async {
    try {
      emit(PasswordResetLoadingState());
      var passwordResetResponse = await passwordResetUseCase.invoke(
        passwordResetRequest: passwordResetRequest,
      );
      emit(
        PasswordResetSccessState(passwordResetResponse: passwordResetResponse),
      );
    } on AppException catch (e) {
      emit(PasswordResetErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(PasswordResetErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void passwordResetResendOtp({
    required PasswordResetResendOtpRequest passwordResetResendOtpRequest,
  }) async {
    try {
      emit(PasswordResetResendOtpLoadingState());
      var passwordResetResendOtpResponse = await passwordResetResendOtpUseCase
          .invoke(passwordResetResendOtpRequest);

      emit(
        PasswordResetResendOtpSccessState(
          passwordResetResendOtpResponse: passwordResetResendOtpResponse,
        ),
      );
    } on AppException catch (e) {
      emit(PasswordResetResendOtpErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(PasswordResetResendOtpErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }

  void passwordResetConfirm({
    required PasswordResetConfirmRequest passwordResetConfirmRequest,
  }) async {
    try {
      emit(PasswordResetConfirmLoadingState());
      var passwordResetConfirmResponse = await passwordResetConfirmUseCase
          .invoke(passwordResetConfirmRequest);

      emit(
        PasswordResetConfirmSccessState(
          passwordResetConfirmResponse: passwordResetConfirmResponse,
        ),
      );
    } on AppException catch (e) {
      emit(PasswordResetConfirmErrorState(message: e.message));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).message
          : "Unexcepted error occurred";
      emit(PasswordResetConfirmErrorState(message: message));
    } catch (e) {
      emit(RegisterErrorState(message: e.toString()));
    }
  }
}
