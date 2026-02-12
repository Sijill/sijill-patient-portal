import 'dart:convert';

class CheckTokenIsExpired {
  // check token
  static bool isTokenExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) return true;

    final payload = String.fromCharCodes(
      base64Url.decode(base64Url.normalize(parts[1])),
    );

    final payloadMap = json.decode(payload);
    final exp = payloadMap['exp'];

    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

    return DateTime.now().isAfter(expiryDate);
  }
}
