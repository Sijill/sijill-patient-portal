class Endpoints {
  static const String baseUrl = "http://192.168.1.5:8000";
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
}
