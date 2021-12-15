import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/utils/constants.dart';
import 'package:maka_live/utils/styles/theme.dart';
import 'package:maka_live/widgets/custom_divider.dart';

class SoldItemCard extends StatelessWidget {
  const SoldItemCard({Key? key, required this.inventoryModel}) : super(key: key);
  final InventoryModel inventoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(Constants.PADDING / 2),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [Constants.SHADOW_LIGHT],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.folder,
            size: 100,
          ),
          Text(
            inventoryModel.itemName,
            style: kTextTheme(context).headline6,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CustomDivider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${inventoryModel.quantity}', style: kTextTheme(context).headline5?.copyWith(color: Theme.of(context).primaryColor)),
                    Container(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(' items sold', style: kTextTheme(context).bodyText1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
