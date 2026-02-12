class LoginResendOtpResponse {
  String? loginSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  LoginResendOtpResponse({
    this.loginSessionId,
    this.otpDelivery,
    this.expiresAt,
  });
}
