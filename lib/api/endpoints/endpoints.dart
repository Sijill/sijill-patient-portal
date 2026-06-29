class Endpoints {
  static const String baseUrl = "http://192.168.1.2:8000";
  static const String registerApi = "/api/v1/auth/register";
  static const String registerResendOtpApi = "/api/v1/auth/register/resend-otp";
  static const String registerVerifyOtpApi = "/api/v1/auth/register/verify-otp";
  static const String loginApi = "/api/v1/auth/login";
  static const String loginResendOtpApi = "/api/v1/auth/login/resend-otp";
  static const String loginVerifyOtpApi = "/api/v1/auth/login/verify-otp";
  static const String passwordResetApi = "/api/v1/auth/password-reset";
  static const String passwordResetResendOtpApi =
      "/api/v1/auth/password-reset/resend-otp";
  static const String passwordResetConfirmApi =
      "/api/v1/auth/password-reset/confirm";
  static const String refreshTokenApi = "/api/v1/auth/refresh";
  static const String generatePermissionTokenApi =
      "/api/v1/clinical/permission-tokens";
  static const String getPermissionTokenApi =
      "/api/v1/clinical/permission-tokens";
  static const String permissionTokenRevokeApi =
      "/api/v1/clinical/permission-tokens/{tokenId}/revoke";

  static const String uploadProfileImageApi = "/api/v1/patient/profile-picture";
  static const String getProfileImageApi = "/api/v1/patient/profile-picture";
  static const String addEmergencyContactApi =
      "/api/v1/patient/emergency-contacts";

  static const String getMedicalIdentityApi =
      "/api/v1/patient/medical-identity";

  static const String deleteEmergencyContactApi =
      "/api/v1/patient/emergency-contacts/{contactId}";

  static const String getHealthJournalDiagonsesApi =
      "/api/v1/patient/health-journal/diagnoses";

  static const String healthJournalNotesApi =
      "/api/v1/patient/health-journal/notes";

  static const String getHealthJournalNotesApi =
      "/api/v1/patient/health-journal/notes";

  static const String getHealthJournalNotesDiagonsesIdApi =
      "/api/v1/patient/health-journal/notes/{diagnosisId}";

  static const String getListMedicalHistoryApi =
      "/api/v1/patient/medical-history";

  static const String getMedicalHistoryApi =
      "/api/v1/patient/medical-history/{encounterId}";

  static const String getListAllPatientNotificationsApi =
      "/api/v1/patient/notifications";

  static const String getNotificationReadApi =
      "/api/v1/patient/notifications/{notificationId}/read";

  static const String getListActivePatientRemindersApi =
      "/api/v1/patient/reminders/active";

  static const String getPendingNotificationApi =
      "/api/v1/patient/notifications/pending";

  static const String updatePatientRemindersApi =
      "/api/v1/patient/reminders/{reminderId}";

  static const String homeReminderCountersApi =
      "/api/v1/patient/home/reminders/counters";

  static const String getTodayScheduleApi =
      "/api/v1/patient/home/today-schedule";

  static const String getListPatientActiveLabOrderApi =
      "/api/v1/clinical/medical-orders/lab";

  static const String generateLabPermissionTokenApi =
      "/api/v1/clinical/medical-orders/{orderId}/permission-tokens/lab";

  static const String getListPatientActiveImagingOrderApi =
      "/api/v1/clinical/medical-orders/imaging";

  static const String generateImagingPermissionTokenApi =
      "/api/v1/clinical/medical-orders/{orderId}/permission-tokens/imaging";

  static const String logoutApi = "/api/v1/auth/logout";

  static const String createNewChatSessionApi =
      "/api/v1/patient/ai/chat/sessions";

  static const String sendMessageToAiAssistantApi =
      "/api/v1/patient/ai/chat/sessions/{sessionId}/messages";

  static const String getListChatSessionApi =
      "/api/v1/patient/ai/chat/sessions";

  static const String deleteAllChatSessionApi =
      "/api/v1/patient/ai/chat/sessions";

  static const String getChatSessionWithMessageApi =
      "/api/v1/patient/ai/chat/sessions/{sessionId}";

  static const String getPatientNameApi = "/api/v1/patient/name";
}
