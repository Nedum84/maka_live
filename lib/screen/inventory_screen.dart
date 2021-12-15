import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maka_live/controller/inventory_controller.dart';
import 'package:maka_live/model/inventory_form_data.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/repository/inventory_repo.dart';
import 'package:maka_live/utils/alert_utils.dart';
import 'package:maka_live/utils/styles/colors.dart';
import 'package:maka_live/widgets/custom_textfield.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  bool isSubmitting = false;
  int noOfItem = 1; //min list

  late List<InventoryFormData> addList;

  @override
  void initState() {
    super.initState();
    _buildList();
  }

  //build initial list
  _buildList() {
    addList = List<InventoryFormData>.generate(noOfItem, (index) => inventoryItem());
    setState(() {});
  }

  //add more item
  _addMore() {
    noOfItem++;
    addList.add(inventoryItem());
    setState(() {});
  }

  //remove item at index n
  removeItem(int index) {
    addList.removeAt(index);
    noOfItem = addList.length;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    addList.map(
      (e) {
        e.nameController.dispose();
        e.qtyController.dispose();
      },
    );
  }

  onSubmit() async {
    bool isError = false;
    for (var element in addList) {
      var index = addList.indexOf(element) + 1;

      final name = element.nameController.text.toString().trim();
      final qty = element.qtyController.text.toString().trim();
      if (name.isEmpty) {
        isError = true;
        AlertUtils.alert('Inventory name ${noOfItem == 1 ? "" : "#$index"} is required');
        break;
      } else if (qty.isEmpty) {
        isError = true;
        AlertUtils.alert('Quantity ${noOfItem == 1 ? "" : "#$index"} is required');
        break;
      } else {
        final qtyInt = int.tryParse(qty);
        if (qtyInt == null) {
          isError = true;
          AlertUtils.alert('Quantity ${noOfItem == 1 ? "" : "#$index"} must be a valid number');
          break;
        }
      }
    }

    if (!isError) {
      final List<InventoryModel> items = addList.map((e) {
        final name = e.nameController.text.toString().trim();
        final qty = e.qtyController.text.toString().trim();
        final qtyInt = int.parse(qty);

        int randomID = Random().nextInt(100) + 11;
        return InventoryModel(
          itemId: "$randomID",
          itemName: name,
          quantity: qtyInt,
        );
      }).toList();

      setState(() => isSubmitting = true);
      final response = await InventoryRepo.createInventory(items: items);
      if (response == false) {
        AlertUtils.alert('Error adding category');
        setState(() => isSubmitting = false);
      } else {
        await InventoryController.to.fetchAll(reset: true);
        AlertUtils.alert(
          'New inventory added successfully',
          okCallback: () async {
            setState(() => isSubmitting = false);
            Get.back();
          },
        );
      }
    }
  }

  _submitLoading() {
    return Transform.scale(
      scale: .7,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Inventory'),
        actions: [
          InkWell(
            onTap: () => isSubmitting ? null : onSubmit(),
            child: Row(
              children: [
                isSubmitting
                    ? _submitLoading()
                    : Row(
                        children: [
                          Icon(Icons.check, color: Theme.of(context).primaryColor),
                          Text(
                            'Add',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        itemCount: addList.length,
        itemBuilder: (builder, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Inventory name ${noOfItem != 1 ? index + 1 : ""}'),
              const SizedBox(height: 8),
              CustomTextField(controller: addList[index].nameController),
              const SizedBox(height: 8),
              Text('Quantity ${noOfItem != 1 ? index + 1 : ""}'),
              const SizedBox(height: 8),
              CustomTextField(controller: addList[index].qtyController, textInputType: TextInputType.number),
              const SizedBox(height: 12),
              if (noOfItem != 1)
                InkWell(
                  onTap: () => removeItem(index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.remove, color: Theme.of(context).primaryColor, size: 12),
                      Text(
                        'Remove',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 24,
          child: Divider(thickness: 1, color: KColors.TEXT_COLOR_DARK.withOpacity(.2)),
        ),
      ),
      floatingActionButton: AddMoreButton(onTap: _addMore),
    );
  }
}

class AddMoreButton extends StatelessWidget {
  const AddMoreButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 100,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Theme.of(context).primaryColorLight),
            Text(
              'Add More',
              style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
