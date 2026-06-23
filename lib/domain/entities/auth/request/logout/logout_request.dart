class LogoutRequest {
  String? platform;
  String? refreshToken;

  LogoutRequest({this.platform = "mobile", this.refreshToken});
}
