import 'package:project1/core/data/global/dio_helper.dart';
import 'package:project1/core/data/global/end_point.dart';
import 'package:project1/features/auth/data/models/login_request_body.dart';

class AuthWebServices {


  Future<dynamic> login(LoginRequestBody loginRequestBody) async {
    var response = await DioHelper.postData(
        endPoint: loginEndPoint, data: loginRequestBody.toJson());
    return response.data;  
  }




  // Future<dynamic> login(
  //     {required String phone, required String password , required String n}) async {
  //   var response = await DioHelper.postData(
  //       endPoint: loginEndPoint, data: {"phone": phone, "password": password});
  //   return response.data; // response.data
  //   /*
  //   {
  //   "_id": "672dd58e14796b9a1cb1ac8c",
  //   "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzJkZDU4ZTE0Nzk2YjlhMWNiMWFjOGMiLCJpYXQiOjE3MzQyODg4NDYsImV4cCI6MTczNDI4OTQ0Nn0.BgHucVpr1eeZKxt6xj7bXSzUc2RxVzV59T92lyGugrE",
  //   "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzJkZDU4ZTE0Nzk2YjlhMWNiMWFjOGMiLCJpYXQiOjE3MzQyODg4NDZ9.2hOR3NtjFAYjgiyaR0rn43CU7P1JStN4NFjyCrykaOk"
  //   } 
  //   */
  // }
}
