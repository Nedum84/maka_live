// To parse this JSON data, do
//
//     final item = itemFromMap(jsonString);

import 'dart:convert';

class InventoryModel {
  InventoryModel({
    required this.itemId,
    required this.itemName,
    required this.quantity,
  });

  final String itemId;
  final String itemName;
  final int quantity;

  factory InventoryModel.fromJson(String str) => InventoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InventoryModel.fromMap(Map<String, dynamic> json) => InventoryModel(
        itemId: json["itemID"],
        itemName: json["itemName"],
        quantity: json["quantity_sold"],
      );

  Map<String, dynamic> toMap() => {
        "itemID": itemId,
        "itemName": itemName,
        "quantity_sold": quantity,
      };
}
