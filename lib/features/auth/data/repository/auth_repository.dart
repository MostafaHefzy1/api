import 'package:project1/features/auth/data/models/login_request_body.dart';
import 'package:project1/features/auth/data/models/login_response.dart';
import 'package:project1/features/auth/data/web_services/auth_web_services.dart';

class AuthRepository {
  final AuthWebServices _authWebServices;
  
  AuthRepository(this._authWebServices);

  Future<LoginReponse> login(LoginRequestBody loginRequestBody) async {
   return LoginReponse.fromJson(await _authWebServices.login(loginRequestBody));
  }




}
