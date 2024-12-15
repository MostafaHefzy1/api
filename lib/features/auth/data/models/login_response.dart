class LoginReponse {
  String? sId;
  String? accessToken;
  String? refreshToken;

  LoginReponse({this.sId, this.accessToken, this.refreshToken});

  LoginReponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}

