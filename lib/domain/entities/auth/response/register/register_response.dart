class RegisterResponse {
  String? registrationSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  RegisterResponse({
    this.registrationSessionId,
    this.otpDelivery,
    this.expiresAt,
  });
}
