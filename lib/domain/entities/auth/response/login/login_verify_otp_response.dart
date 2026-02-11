class LoginVerifyOtpResponse {
  bool? success;
  String? message;
  String? userId;
  String? email;
  String? role;
  String? accessToken;
  String? refreshToken;

  LoginVerifyOtpResponse({
    this.success,
    this.message,
    this.userId,
    this.email,
    this.role,
    this.accessToken,
    this.refreshToken,
  });
}
