import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maka_live/controller/inventory_controller.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/repository/inventory_repo.dart';
import 'package:maka_live/utils/alert_utils.dart';
import 'package:maka_live/utils/constants.dart';
import 'package:maka_live/utils/styles/theme.dart';
import 'package:maka_live/widgets/bottom_sheet/bottom_sheet_container.dart';

class BuyItemBottomSheet extends StatefulWidget {
  const BuyItemBottomSheet({Key? key, required this.inventoryModel}) : super(key: key);
  final InventoryModel inventoryModel;

  @override
  State<BuyItemBottomSheet> createState() => _BuyItemBottomSheetState();
}

class _BuyItemBottomSheetState extends State<BuyItemBottomSheet> {
  bool isLoading = false;

  _onTap() async {
    setState(() => isLoading = true);
    final response = await InventoryRepo.buyItem(itemID: widget.inventoryModel.itemId);

    if (response == "ok") {
      await InventoryController.to.fetchAll(reset: true);
      AlertUtils.alert(
        'Item purchased successfully',
        okCallback: () async {
          setState(() => isLoading = false);
          Get.back();
        },
      );
    } else {
      AlertUtils.alert(response ?? 'An error occurred, try again');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetContainer(
      title: 'Details',
      sheetHeight: 250,
      child: Expanded(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(Constants.PADDING / 2),
              child: Row(
                children: [
                  const Icon(
                    Icons.folder_rounded,
                    size: 100,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.inventoryModel.itemName,
                          style: kTextTheme(context).headline5,
                        ),
                        const SizedBox(height: 8),
                        CustomButton(onTap: _onTap, isLoading: isLoading)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.isLoading}) : super(key: key);
  final Function() onTap;
  final bool isLoading;

  _loadingSpinner() {
    return Transform.scale(
      scale: .6,
      child: const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isLoading ? null : onTap(),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 40,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? _loadingSpinner()
            : Text(
                'Buy Now',
                style: TextStyle(color: Theme.of(context).primaryColorLight, fontSize: 16),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
