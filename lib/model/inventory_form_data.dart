import 'package:flutter/material.dart';

//Form data fields for new inventory
class InventoryFormData {
  InventoryFormData({required this.nameController, required this.qtyController});
  final TextEditingController nameController;
  final TextEditingController qtyController;
}

//Inventory form item
InventoryFormData inventoryItem() {
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  return InventoryFormData(nameController: nameController, qtyController: qtyController);
}
