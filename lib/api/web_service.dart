import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_confirm_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_confirm_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/request/add_emergency_contact/add_emergency_contact_request_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/add_emergency_contact/add_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/upload_profile_image/upload_profile_image_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/request/generate_permission_token/generate_permission_token_request_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/request/permission_token_revoke/permission_token_revoke_request_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/generate_permission_token/generate_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/get_permission_token/get_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/permission_token_revoke/permission_token_revoke_response_dto.dart';

part 'web_service.g.dart';

@RestApi()
abstract class WebService {
  factory WebService(Dio dio, {String? baseUrl}) = _WebService;

  @POST(Endpoints.registerApi)
  @MultiPart()
  Future<RegisterResponseDto> register(
    @Part(name: 'role') String role,
    @Part(name: 'email') String email,
    @Part(name: 'phoneNumber') String phoneNumber,
    @Part(name: 'password') String password,
    @Part(name: 'firstName') String firstName,
    @Part(name: 'middleName') String middleName,
    @Part(name: 'surName') String surName,
    @Part(name: 'gender') String gender,
    @Part(name: 'dateOfBirth') String dateOfBirth,
    @Part(name: 'nationalId') String nationalId,
    @Part(name: 'nationalIdFront') MultipartFile nationalIdFront,
    @Part(name: 'nationalIdBack') MultipartFile nationalIdBack,
    @Part(name: 'selfieWithId') MultipartFile selfieWithId,
  );

  @POST(Endpoints.registerResendOtpApi)
  Future<RegisterResendOtpResponseDto> registerResendOtp(
    @Body() RegisterResendOtpRequestDto registerResendOtpRequest,
  );

  @POST(Endpoints.registerVerifyOtpApi)
  Future<RegisterVerifyOtpResponseDto> registerVerifyOtp(
    @Body() RegisterVerifyOtpRequestDto registerVerifyOtpRequestDto,
  );

  @POST(Endpoints.loginApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(Endpoints.loginResendOtpApi)
  Future<LoginResendOtpResponseDto> loginResendOtp(
    @Body() LoginResendOtpRequestDto loginResendOtpRequest,
  );

  @POST(Endpoints.loginVerifyOtpApi)
  Future<LoginVerifyOtpResponseDto> loginVerifyOtp(
    @Body() LoginVerifyOtpRequestDto loginVerfiyOtpRequest,
  );

  @POST(Endpoints.passwordResetApi)
  Future<PasswordResetResponseDto> passwordReset(
    @Body() PasswordResetRequestDto passwordResetRequest,
  );

  @POST(Endpoints.passwordResetResendOtpApi)
  Future<PasswordResetResendOtpResponseDto> passwordResetResendOtp(
    @Body() PasswordResetResendOtpRequestDto passwordResetResendOtpRequest,
  );

  @POST(Endpoints.passwordResetConfirmApi)
  Future<PasswordResetConfirmResponseDto> passwordResetConfirm(
    @Body() PasswordResetConfirmRequestDto passwordResetConfirmRequest,
  );

  @POST(Endpoints.generatePermissionTokenApi)
  Future<GeneratePermissionTokenResponseDto> generatePermissionToken(
    @Body() GeneratePermissionTokenRequestDto generatePermissionTokenRequest,
  );

  @GET(Endpoints.getPermissionTokenApi)
  Future<GetPermissionTokenResponseDto> getPermissionToken();

  @PATCH(Endpoints.permissionTokenRevokeApi)
  Future<PermissionTokenRevokeResponseDto> permissionTokenRevoke(
    @Path() PermissionTokenRevokeRequestDto permissionTokenRevokeRequest,
  );

  @POST(Endpoints.uploadProfileImageApi)
  Future<UploadProfileImageResponseDto> uploadProfileImage(
    @Part(name: 'profilePicture') MultipartFile profilePicture,
  );

  @GET(Endpoints.getProfileImageApi)
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getProfileImage();

  @POST(Endpoints.addEmergencyContactApi)
  Future<AddEmergencyContactResponseDto> addEmergencyContact(
    @Body() AddEmergencyContactRequestDto addEmergencyContactRequest,
  );

  @GET(Endpoints.getMedicalIdentityApi)
  Future<GetMedicalIdentityResponseDto> getMedicalIdentity();

  @DELETE(Endpoints.deleteEmergencyContactApi)
  Future<DeleteEmergencyContactResponseDto> deleteEmergencyContact(
    @Path("contactId") String contactId,
  );
}
