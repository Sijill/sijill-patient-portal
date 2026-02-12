class PasswordResetResendOtpResponse {
  String? resetSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  PasswordResetResendOtpResponse({
    this.resetSessionId,
    this.otpDelivery,
    this.expiresAt,
  });
}
