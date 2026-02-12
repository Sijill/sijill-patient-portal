class LoginResponse {
  String? loginSessionId;
  String? otpDelivery;
  DateTime? expiresAt;

  LoginResponse({this.loginSessionId, this.otpDelivery, this.expiresAt});
}
