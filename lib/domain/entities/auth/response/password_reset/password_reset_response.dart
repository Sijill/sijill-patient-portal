class PasswordResetResponse {
  String? resetSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  PasswordResetResponse({
    this.resetSessionId,
    this.otpDelivery,
    this.expiresAt,
  });
}
