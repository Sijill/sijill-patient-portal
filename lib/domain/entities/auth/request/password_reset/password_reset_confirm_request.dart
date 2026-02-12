class PasswordResetConfirmRequest {
  String? resetSessionId;
  String? otp;
  String? newPassword;

  PasswordResetConfirmRequest({
    this.resetSessionId,
    this.otp,
    this.newPassword,
  });
}
