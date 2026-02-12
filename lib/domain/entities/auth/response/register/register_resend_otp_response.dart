class RegisterResendOtpResponse {
  String? registrationSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  RegisterResendOtpResponse({
    this.registrationSessionId,
    this.otpDelivery,
    this.expiresAt,
  });
}
