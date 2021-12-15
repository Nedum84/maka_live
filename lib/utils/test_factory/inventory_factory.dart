import 'package:maka_live/model/item_model.dart';

final List<InventoryModel> factoryInventoryAdd = [
  InventoryModel(itemId: "1", itemName: 'Super Fancy Dress', quantity: 20),
  InventoryModel(itemId: "2", itemName: 'Fancy T-Shirt', quantity: 10),
];

const List<Map<String, dynamic>> factoryInventoryAddMap = [
  {"itemID": 1, "itemName": "Super Fancy Dress", "quantity": 20},
  {"itemID": 2, "itemName": "Fancy T-Shirt", "quantity": 10}
];

const factoryInventories = '''
    [
        {
            "itemID": "1",
            "itemName": "Super Fancy Dress",
            "quantity_sold": 10
        },
        {
            "itemID": "2",
            "itemName": "Fancy T-Shirt",
            "quantity_sold": 1
        }
    ]
''';
