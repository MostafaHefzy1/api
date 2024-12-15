import 'package:project1/features/home/data/models/list_item_model.dart';
import 'package:project1/features/home/data/web_services/home_web_services.dart';

class HomeRepository {
  final HomeWebServices _homeWebServices;

  HomeRepository(this._homeWebServices);

  Future<List<ItemModel>> getList(int page) async {
    List result = await _homeWebServices.getList(page);
    return result.map((e) => ItemModel.fromJson(e)).toList();
    // List<ItemModel> list = [];
    // for (int i = 0; i < result.length; i++) {
    //   list.add(ItemModel.fromJson(result[i]));
    // }
    // return list;
  }
}
