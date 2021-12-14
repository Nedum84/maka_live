import 'package:dio/dio.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/repository/client/api_client.dart';

class InventoryRepo {
  static Future<List<InventoryModel>?> findShowsById({String showId = "222"}) async {
    try {
      Response response = await apiClient.get('/show/${222}');

      if (response.statusCode == 200) {
        var items = response.data;
        var list = (items as List).map((data) => InventoryModel.fromMap(data)).toList();
        return list;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<InventoryModel?> createInventory({required List<InventoryModel> items}) async {
    final List<Map<String, dynamic>> itemMap = items.map((e) => e.toMap()).toList();
    try {
      Response response = await apiClient.post('/inventory', data: itemMap);

      print(response.data);

      if (response.statusCode == 200) {
        return InventoryModel.fromMap(response.data);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<bool> buyItem({String showId = "222", required String itemID}) async {
    try {
      Response response = await apiClient.post('/show/$showId/buy_item/$itemID');

      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }
}
