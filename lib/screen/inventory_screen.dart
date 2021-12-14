import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maka_live/utils/styles/colors.dart';
import 'package:maka_live/widgets/custom_textfield.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({Key? key}) : super(key: key);

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController qtyController = TextEditingController();

  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    qtyController.dispose();
  }

  onSubmit() async {
    // final catName = catNameController.text.toString().trim();
    // if (catName.isEmpty) {
    //   AlertUtils.toast('Category name is required');
    // } else if (imageUrl.isEmpty) {
    //   AlertUtils.toast('Category banner is required');
    // } else {
    //   AlertUtils.showProgressDialog(title: null);
    //   //Upload Banner/Icon if not already uploaded
    //   if (!imageUrl.contains('https')) {
    //     //--> Delete the previous one
    //     if (isEditing) await _storageMethods.delete(widget.category!.categoryIcon!, StorageEnum.CATEGORY);
    //     //Upload the new one
    //     final selectedImage = File(imageUrl);
    //     final String? uploadedImgPath = await _storageMethods.uploadFile(selectedImage, StorageEnum.CATEGORY);
    //     if (uploadedImgPath == null || uploadedImgPath == "") {
    //       AlertUtils.toast('Error uploading image');
    //       AlertUtils.hideProgressDialog();
    //       return;
    //     } else {
    //       setState(() => imageUrl = uploadedImgPath);
    //     }
    //   }
    //   //--> Check editing
    //   if (isEditing) {
    //     edit(catName);
    //   } else {
    //     addNew(catName);
    //   }
    // }
  }

  addNew(String catName) async {
    // final newCat = Category(
    //   categoryName: catName,
    //   categoryIcon: imageUrl,
    // );
    //
    // final createCat = await RepoCategory.addCategory(category: newCat);
    // if (createCat == null) {
    //   AlertUtils.toast('Error adding category');
    //   AlertUtils.hideProgressDialog();
    // } else {
    //   AlertUtils.hideProgressDialog();
    //   Get.back(result: createCat);
    // }
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
        title: const Text('Add Inventory'),
        actions: [
          InkWell(
            onTap: onSubmit,
            child: Row(
              children: [
                isSubmitting
                    ? _submitLoading()
                    : Row(
                        children: [
                          Icon(Icons.check, color: Theme.of(context).primaryColor),
                          Text(
                            'Submit',
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
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        children: [
          const Text('Inventory name'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: KColors.TEXT_COLOR_LIGHT.withOpacity(.5)),
              color: Colors.white,
            ),
            child: CustomTextField(controller: nameController),
          ),
          const SizedBox(height: 24),
          const Text('Quantity'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: KColors.TEXT_COLOR_LIGHT.withOpacity(.5)),
              color: Colors.white,
            ),
            child: CustomTextField(controller: qtyController),
          ),
        ],
      ),
    );
  }
}
