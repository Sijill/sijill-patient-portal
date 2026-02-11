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
import 'package:sijil_patient_portal/api/mapper/auth/refresh_token_request_mapper.dart';
import 'package:sijil_patient_portal/api/mapper/auth/refresh_token_response_mapper.dart';
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
import 'package:sijil_patient_portal/domain/entities/auth/request/refresh_token/refresh_token_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_resend_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/request/register/register_verify_otp_request.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/login/login_verify_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_confirm_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/password_reset/password_reset_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/refresh_token/refresh_token_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_resend_otp_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_response.dart';
import 'package:sijil_patient_portal/domain/entities/auth/response/register/register_verify_otp_response.dart';

@Injectable(as: AuthDataSources)
class AuthDataSourcesImpl implements AuthDataSources {
  WebService webService;
  AuthDataSourcesImpl({required this.webService});
  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    //todo: RegisterRequest => RegisterRequestDto
    final registerDto = registerRequest.convertToRegisterRequestDto();

    final frontFile = await MultipartFile.fromFile(
      registerDto.nationalIdFront!,
      filename: 'nationalIdFront.jpg',
    );

    final backFile = await MultipartFile.fromFile(
      registerDto.nationalIdBack!,
      filename: 'nationalIdBack.jpg',
    );

    final selfieFile = await MultipartFile.fromFile(
      registerDto.selfieWithId!,
      filename: 'selfieWithId.jpg',
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
      loginVerfiyOtpRequest.convertToLoginVerfiyOtpRequestDto(),
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

  @override
  Future<RefreshTokenResponse> refreshToken(
    RefreshTokenRequest refreshTokenRequest,
  ) async {
    //todo: RefreshTokenRequest => RefreshTokenRequestDto
    var refreshTokenResponse = await webService.refreshToken(
      refreshTokenRequest.convertToRefreshTokenRequestDto(),
    );

    //todo: RefreshTokenResponseDto => RefreshTokenResponse
    return refreshTokenResponse.convertToRefreshTokenResponse();
  }
}
