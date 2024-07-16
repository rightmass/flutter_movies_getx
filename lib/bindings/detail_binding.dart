import 'package:get/get.dart';

import '../view_models/detail_view_model.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailViewModel());
  }
}
