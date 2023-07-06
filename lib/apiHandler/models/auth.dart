class AuthResponse {
  final String apikey;
  AuthResponse(this.apikey);
  AuthResponse.fromJson(Map<String, dynamic> jsonString)
      : apikey = jsonString['apikey'];
  Map<String, dynamic> toJson() => {'apikey': apikey};
}

class AuthRequest {
  final String user;
  final String pass;
  AuthRequest(this.user, this.pass);
  Map<String, dynamic> toJson() =>
      {'user': user, 'pass': pass, 'device': 'flutter_client'};
}
