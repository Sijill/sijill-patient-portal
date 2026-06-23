import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sijil_patient_portal/api/endpoints/endpoints.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/login/login_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/logout/logout_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_confirm_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/password_reset/password_reset_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_resend_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/request/register/register_verify_otp_request_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/login/login_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/logout/logout_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_confirm_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/password_reset/password_reset_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_resend_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_response_dto.dart';
import 'package:sijil_patient_portal/api/model/auth/response/register/register_verify_otp_response_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/request/create_new_chat_session_request/create_new_chat_session_request_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/request/send_message_to_ai_assistant_request/send_message_to_ai_assistant_request_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/response/create_new_chat_session_response/create_new_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/response/delete_all_chat_session_response/delete_all_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/response/get_chat_session_with_message_response/get_chat_session_with_message_response_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/response/list_chat_session_response/list_chat_session_response_dto.dart';
import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/send_message_to_ai_assistant_response_dto.dart';
import 'package:sijil_patient_portal/api/model/health_journal/request/health_journal_notes/health_journal_notes_requst_dto.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_diagonses/get_health_journal_diagonses_response_dto.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes/get_health_journal_notes_response_dto.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/get_health_journal_notes_diagones_id_response_dto/get_health_journal_notes_diagones_id_response_dto.dart';
import 'package:sijil_patient_portal/api/model/health_journal/response/health_journal_notes/health_journal_notes_response_dto.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/home_reminder_counters_response/home_reminder_counters_response_dto.dart';
import 'package:sijil_patient_portal/api/model/home_tab/response/today_schedule_response/today_schedule_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_list_medical_history_response/get_list_medical_history_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_history/response/get_medical_history_response_dto/get_medical_history_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/request/add_emergency_contact/add_emergency_contact_request_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/add_emergency_contact/add_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/delete_emergency_contact/delete_emergency_contact_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/get_medical_identity/get_medical_identity_response_dto.dart';
import 'package:sijil_patient_portal/api/model/medical_identity/response/upload_profile_image/upload_profile_image_response_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/request/update_patient_reminder_request/update_patient_reminder_request_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_active_patient_reminders_response/list_active_patient_reminders_response_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/list_all_patient_notification_response/list_all_patient_notification_response_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/notification_read_response/notification_read_response_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/pending_notification_response/pending_notification_response_dto.dart';
import 'package:sijil_patient_portal/api/model/notfication/response/update_patient_reminders_response/update_patient_reminders_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/request/generate_permission_token/generate_permission_token_request_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/generate_imaging_permission_token_response/generate_imaging_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/generate_lab_permission_token_response/generate_lab_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/generate_permission_token/generate_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/get_permission_token/get_permission_token_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_imaging_order_response/list_patient_active_imaging_order_response_dto.dart';
import 'package:sijil_patient_portal/api/model/permission_token/response/list_patient_active_lab_order_response/list_patient_active_lab_order_response_dto.dart';
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
    @Path() String tokenId,
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

  @GET(Endpoints.getHealthJournalDiagonsesApi)
  Future<GetHealthJournalDiagonsesResponseDto> getHealthJournalDiagonses();

  @POST(Endpoints.healthJournalNotesApi)
  Future<HealthJournalNotesResponseDto> healthJournalNotes(
    @Body() HealthJournalNotesRequstDto healthJournalNotesRequest,
  );

  @GET(Endpoints.getHealthJournalNotesApi)
  Future<GetHealthJournalNotesResponseDto> getHealthJournalNotes();

  @GET(Endpoints.getHealthJournalNotesDiagonsesIdApi)
  Future<GetHealthJournalNotesDiagonesIdResponseDto>
  getHealthJournalNotesDiagonsesId(@Path("diagnosisId") String diagnosisId);

  @GET(Endpoints.getListMedicalHistoryApi)
  Future<GetListMedicalHistoryResponseDto> getListMedicalHistory();

  @GET(Endpoints.getMedicalHistoryApi)
  Future<GetMedicalHistoryResponseDto> getMedicalHistory(
    @Path("encounterId") String encounterId,
  );

  @GET(Endpoints.getListAllPatientNotificationsApi)
  Future<ListAllPatientNotificationResponseDto> getListAllPatientNotification();

  @PATCH(Endpoints.getNotificationReadApi)
  Future<NotificationReadResponseDto> getNotificationRead(
    @Path("notificationId") String notificationId,
  );

  @GET(Endpoints.getListActivePatientRemindersApi)
  Future<ListActivePatientRemindersResponseDto> getListActivePatientReminders();

  @GET(Endpoints.getPendingNotificationApi)
  Future<PendingNotificationResponseDto> getPendingNotification();

  @PATCH(Endpoints.updatePatientRemindersApi)
  Future<UpdatePatientRemindersResponseDto> updatePatientReminders(
    @Path("reminderId") String reminderId,
    @Body() UpdatePatientReminderRequestDto updatePatientReminderRequest,
  );

  @GET(Endpoints.homeReminderCountersApi)
  Future<HomeReminderCountersResponseDto> homeReminderCounters();

  @GET(Endpoints.getTodayScheduleApi)
  Future<TodayScheduleResponseDto> getTodaySchedule();

  @GET(Endpoints.getListPatientActiveLabOrderApi)
  Future<ListPatientActiveLabOrderResponseDto> getListPatientActiveLabOrder();

  @POST(Endpoints.generateLabPermissionTokenApi)
  Future<GenerateLabPermissionTokenResponseDto> generateLabOrderPermissionToken(
    @Path("orderId") String orderId,
  );

  @GET(Endpoints.getListPatientActiveImagingOrderApi)
  Future<ListPatientActiveImagingOrderResponseDto>
  getListPatientActiveImagingOrder();

  @POST(Endpoints.generateImagingPermissionTokenApi)
  Future<GenerateImagingPermissionTokenResponseDto>
  generateImagingOrderPermissionToken(@Path("orderId") String orderId);

  @POST(Endpoints.logoutApi)
  Future<LogoutResponseDto> logout(@Body() LogoutRequestDto logoutRequest);

  @POST(Endpoints.createNewChatSessionApi)
  Future<CreateNewChatSessionResponseDto> createNewChatSession(
    @Body() CreateNewChatSessionRequestDto createNewChatSessionRequest,
  );

  @POST(Endpoints.sendMessageToAiAssistantApi)
  Future<SendMessageToAiAssistantResponseDto> sendMessageToAiAssistant(
    @Path("sessionId") String sessionId,
    @Body() SendMessageToAiAssistantRequestDto sendMessageToAiAssistantRequest,
  );

  @GET(Endpoints.getListChatSessionApi)
  Future<ListChatSessionResponseDto> getListChatSession();

  @DELETE(Endpoints.deleteAllChatSessionApi)
  Future<DeleteAllChatSessionResponseDto> deleteAllChatSession();

  @GET(Endpoints.getChatSessionWithMessageApi)
  Future<GetChatSessionWithMessageResponseDto> getChatSessionWithMessage(
    @Path("sessionId") String sessionId,
  );
}
