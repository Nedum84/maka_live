import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:maka_live/controller/inventory_controller.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/screen/inventory_screen.dart';
import 'package:maka_live/screen/widgets/buy_item_bottom_sheet.dart';
import 'package:maka_live/utils/constants.dart';
import 'package:maka_live/utils/styles/theme.dart';
import 'package:maka_live/widgets/list_item/available_item.dart';
import 'package:maka_live/widgets/list_item/sold_item_card.dart';

class LiveShowScreen extends StatelessWidget {
  const LiveShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => InventoryController.to.fetchAll(reset: true),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Live Shows'),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => const InventoryScreen()),
              icon: const Icon(Icons.add_box),
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: const [
            SizedBox(height: 16),
            ShowItemsSold(),
            SizedBox(height: 16),
            BuyNewItems(),
          ],
        ),
      ),
    );
  }
}

class ShowItemsSold extends StatelessWidget {
  const ShowItemsSold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(
      init: InventoryController(),
      builder: (iController) {
        if (iController.isLoading && iController.inventoryList.isEmpty) {
          return Container(
            margin: EdgeInsets.all(Constants.PADDING),
            child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
          );
        }
        if (iController.inventoryList.isEmpty) {
          return NoInventoryFound(controller: iController, text: 'No inventory sold');
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(Constants.PADDING / 2),
              child: Text(
                'Sold Items',
                style: kTextTheme(context).headline5,
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 210,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Constants.PADDING / 2),
                scrollDirection: Axis.horizontal,
                itemCount: iController.inventoryList.length,
                itemBuilder: (context, index) {
                  return SoldItemCard(inventoryModel: iController.inventoryList[index]);
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
              ),
            ),
          ],
        );
      },
    );
  }
}

class BuyNewItems extends StatelessWidget {
  const BuyNewItems({Key? key}) : super(key: key);

  _showProductDetail(InventoryModel inventoryModel) {
    Get.bottomSheet(
      BuyItemBottomSheet(inventoryModel: inventoryModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(builder: (iController) {
      if (iController.isLoading && iController.inventoryList.isEmpty) {
        return Container(
          margin: EdgeInsets.all(Constants.PADDING),
          child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
        );
      }
      if (iController.inventoryList.isEmpty) {
        return NoInventoryFound(controller: iController, text: 'No available inventory found');
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(Constants.PADDING / 2),
            child: Text(
              'Available Items',
              style: kTextTheme(context).headline5,
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: Constants.PADDING / 2).copyWith(bottom: Constants.PADDING),
            itemCount: iController.inventoryList.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return AvailableItem(
                onTap: () => _showProductDetail(iController.inventoryList[index]),
                inventoryModel: iController.inventoryList[index],
              );
            },
          ),
        ],
      );
    });
  }
}

class NoInventoryFound extends StatelessWidget {
  const NoInventoryFound({Key? key, required this.controller, required this.text}) : super(key: key);
  final InventoryController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Constants.PADDING),
      child: Text.rich(
        TextSpan(
          text: text,
          children: <TextSpan>[
            TextSpan(
              text: ' Retry',
              recognizer: TapGestureRecognizer()..onTap = () => controller.fetchAll(reset: true),
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
            )
            // can add more TextSpans here...
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
