import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_resend_otp_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_resend_otp_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_verify_otp_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/login_verify_otp_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_confirm_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_confirm_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_resend_otp_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_resend_otp_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/password_reset_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_resend_otp_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_resend_otp_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_response_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_verify_otp_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/register_verify_otp_response_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/auth/auth_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/login/login_verfiy_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_confirm_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/password_reset/password_reset_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';
import 'package:sijil_patient_portal/features/auth/widget/customed_compress_image.dart';

@Injectable(as: AuthDataSources)
class AuthDataSourcesImpl implements AuthDataSources {
  WebService webService;
  AuthDataSourcesImpl({required this.webService});
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    //todo: RegisterRequest => RegisterRequestDto
    final registerDto = registerRequest.convertToRegisterRequestDto();

    final compressedNationalIdFrontImage =
        await CustomedCompressImage.compressImage(
          File(registerDto.nationalIdFront!),
        );
    if (compressedNationalIdFrontImage == null) {
      throw Exception("Failed to compress national ID front image");
    }
    final frontFile = await MultipartFile.fromFile(
      compressedNationalIdFrontImage.path,
      filename: 'nationalIdFront.jpeg',
    );

    final compressedNationalIdBackImage =
        await CustomedCompressImage.compressImage(
          File(registerDto.nationalIdBack!),
        );
    if (compressedNationalIdBackImage == null) {
      throw Exception("Failed to compress national ID back image");
    }
    final backFile = await MultipartFile.fromFile(
      compressedNationalIdBackImage.path,
      filename: 'nationalIdBack.jpeg',
    );

    final compressedSelfieWithIdImage =
        await CustomedCompressImage.compressImage(
          File(registerDto.selfieWithId!),
        );
    if (compressedSelfieWithIdImage == null) {
      throw Exception("Failed to compress selfieWithId image");
    }
    final selfieFile = await MultipartFile.fromFile(
      compressedSelfieWithIdImage.path,
      filename: 'selfieWithId.jpeg',
    );
    final response = await webService.register(
      registerDto.role!,
      registerDto.email!,
      registerDto.phoneNumber!,
      registerDto.password!,
      registerDto.firstName!,
      registerDto.middleName!,
      registerDto.surName!,
      registerDto.gender!,
      registerDto.dateOfBirth!,
      registerDto.nationalId!,
      frontFile,
      backFile,
      selfieFile,
    );
    //todo: RegisterResponseDto => RegisterResponse
    return response.convertToRegisterResponse();
  }

  @override
  Future<RegisterResendOtpResponse> registerResendOtp(
    RegisterResendOtpRequest registerResendOtpRequest,
  ) async {
    //todo: RegisterResendOtpRequest => RegisterResendOtpRequestDto
    var registerResendOtpResponse = await webService.registerResendOtp(
      registerResendOtpRequest.convertToRegisterResendOtpRequest(),
    );

    //todo: RegisterResendOtpResponseDto => RegisterResendOtpResponse
    return registerResendOtpResponse.convertToRegisterResendOtpResponse();
  }

  @override
  Future<RegisterVerifyOtpResponse> registerVerifyOtp(
    RegisterVerifyOtpRequest registerVerifyOtpRequest,
  ) async {
    //todo: RegisterVerifyOtpRequest => RegisterVerifyOtpRequestDto
    var registerVerifyOtpResponse = await webService.registerVerifyOtp(
      registerVerifyOtpRequest.convertToRegisterVerifyOtpRequestDto(),
    );

    //todo: RegisterVerifyOtpResponseDto => RegisterVerifyOtpResponse
    return registerVerifyOtpResponse.convertToRegisterVerifyOtpResponse();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    //todo: LoginRequest => LoginRequestDto
    var loginResponse = await webService.login(
      loginRequest.convertToLoginRequestDto(),
    );

    //todo: LoginResponseDto => LoginResponse
    return loginResponse.cnvertToLoginResponse();
  }

  @override
  Future<LoginResendOtpResponse> loginResendOtp(
    LoginResendOtpRequest loginResendOtpRequest,
  ) async {
    //todo: LoginResendOtpRequest => LoginResendOtpRequestDto
    var loginResendOtpResponse = await webService.loginResendOtp(
      loginResendOtpRequest.convertToLoginResendOtpRequestDto(),
    );

    //todo: LoginResendOtpResponseDto => LoginResendOtpResponse
    return loginResendOtpResponse.convertToLoginResendOtpResponse();
  }

  @override
  Future<LoginVerifyOtpResponse> loginVerifyOtp(
    LoginVerfiyOtpRequest loginVerfiyOtpRequest,
  ) async {
    //todo: LoginVerfiyOtpRequest => LoginVerfiyOtpRequestDto
    var loginVerifyOtpResponse = await webService.loginVerifyOtp(
      loginVerfiyOtpRequest.convertToLoginVerifyOtpRequestDto(),
    );

    //todo: LoginVerifyOtpResponseDto => LoginVerifyOtpResponse
    return loginVerifyOtpResponse.convertToLoginVerifyOtpResponse();
  }

  @override
  Future<PasswordResetResponse> passwordReset(
    PasswordResetRequest passwordResetRequest,
  ) async {
    //todo: PasswordResetRequest => PasswordResetRequestDto
    var passwordResetResponse = await webService.passwordReset(
      passwordResetRequest.convertToPasswordResetRequestDto(),
    );

    //todo: PasswordResetResponseDto => PasswordResetResponse
    return passwordResetResponse.convertToPasswordResetResponse();
  }

  @override
  Future<PasswordResetResendOtpResponse> passwordResetResendOtp(
    PasswordResetResendOtpRequest passwordResetResendOtpRequest,
  ) async {
    //todo: PasswordResetResendOtpRequest => PasswordResetResendOtpRequestDto
    var passwordResetResendOtpResponse = await webService
        .passwordResetResendOtp(
          passwordResetResendOtpRequest
              .convertToPasswordResetResendOtpRequestDto(),
        );

    //todo: PasswordResetResendOtpResponseDto => PasswordResetResendOtpResponse
    return passwordResetResendOtpResponse
        .convertToPasswordResetResendOtpResponse();
  }

  @override
  Future<PasswordResetConfirmResponse> passwordResetConfirm(
    PasswordResetConfirmRequest passwordResetConfirmRequest,
  ) async {
    //todo: PasswordResetConfirmRequest => PasswordResetConfirmRequestDto
    var passwordResetConfirmResponse = await webService.passwordResetConfirm(
      passwordResetConfirmRequest.convertToPasswordResetConfirmRequestDto(),
    );

    //todo: PasswordResetConfirmResponseDto => PasswordResetConfirmResponse
    return passwordResetConfirmResponse.convertToPasswordResetConfirmResponse();
  }
}
