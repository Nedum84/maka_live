import 'package:flutter/material.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/utils/constants.dart';
import 'package:maka_live/utils/styles/theme.dart';

class AvailableItem extends StatelessWidget {
  const AvailableItem({Key? key, required this.onTap, required this.inventoryModel}) : super(key: key);
  final InventoryModel inventoryModel;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Constants.PADDING / 2),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [Constants.SHADOW_LIGHT],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.admin_panel_settings,
              size: 100,
            ),
            Text(
              inventoryModel.itemName,
              style: kTextTheme(context).headline6,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
