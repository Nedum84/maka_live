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

  static Future<bool> createInventory({required List<InventoryModel> items}) async {
    List<Map<String, dynamic>> itemMap = items.map((e) => e.toMap()).toList();

    itemMap = itemMap
        .map(
          (element) => {
            "itemID": element["itemID"],
            "itemName": element["itemName"],
            "quantity": element["quantity_sold"],
          },
        )
        .toList();

    print(itemMap);
    try {
      Response response = await apiClient.post('/inventory', data: itemMap);

      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  static Future<String?> buyItem({String showId = "222", required String itemID}) async {
    try {
      Response response = await apiClient.post('/show/$showId/buy_item/$itemID');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "ok";
      }
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 409) {
          // return "Item is no longer in stock";
        }

        // ignore: unnecessary_null_comparison
        if (error != null && error.response?.data?.containsKey("message")) {
          return error.response!.data?["message"] ?? error.message;
        } else {
          return error.message;
        }
      }
    }

    return null;
  }
}
