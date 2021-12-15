import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/repository/client/api_client.dart';
import 'package:maka_live/repository/inventory_repo.dart';
import 'package:maka_live/utils/test_factory/inventory_factory.dart';

void main() async {
  final dio = apiClient;
  final dioAdapter = DioAdapter(dio: dio);

  final dioInterceptor = DioInterceptor(dio: dio);
  dio.interceptors.add(dioInterceptor);

  dio.httpClientAdapter = dioAdapter;

  dioInterceptor
    ..onPost(
      "/inventory",
      (server) {
        return server.reply(201, '{ "statusCode": 201, "message": "Ok" }');
      },
      data: factoryInventoryAddMap,
    )
    ..onPost(
      "/show/222/buy_item/1",
      (server) {
        return server.reply(201, '{ "statusCode": 201, "message": "Ok" }');
      },
    )
    ..onGet(
      "/show/222",
      (server) => server.reply(200, json.decode(factoryInventories)),
    );

  group('Api Calls', () {
    test('Should get all show inventories...', () async {
      expect(await InventoryRepo.findShowsById(), isA<List<InventoryModel>>());
    });

    test('should buy a show product', () async {
      expect(await InventoryRepo.buyItem(itemID: "1"), isA<String>());
    });

    test('should add a show inventory', () async {
      expect(await InventoryRepo.createInventory(items: factoryInventoryAdd), isA<bool>());
    });
  });
}
