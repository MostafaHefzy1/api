import 'package:project1/core/network/global/dio_helper.dart';
import 'package:project1/core/network/global/end_point.dart';

class HomeWebServices {


  
  Future<dynamic> getList(int page) async {
    var response = await DioHelper.getData(
        endPoint: todosEndPoint, queryParameters: {"page": page});
    return response.data;
  }


}
