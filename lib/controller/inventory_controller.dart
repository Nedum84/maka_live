import 'package:get/get.dart';
import 'package:maka_live/model/item_model.dart';
import 'package:maka_live/repository/inventory_repo.dart';

class InventoryController extends GetxController {
  static InventoryController to = Get.find();
  final List<InventoryModel> _inventoryList = <InventoryModel>[];
  bool _isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchAll(reset: true);
  }

  List<InventoryModel> get inventoryList => _inventoryList;
  bool get isLoading => _isLoading;

  Future<List<InventoryModel>> fetchAll({bool reset = false}) async {
    setLoading(true);
    if (reset == true || _inventoryList.isEmpty) {
      var items = await InventoryRepo.findShowsById();
      setLoading(false);
      if (items != null) {
        if (reset) _inventoryList.clear();
        _inventoryList.addAll(items);
        update();
      }
    }
    return _inventoryList;
  }

  setLoading(bool loading) {
    _isLoading = loading;
    update();
  }
}
