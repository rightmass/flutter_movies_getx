import 'package:get/get.dart';

import '../providers/movie_provider.dart';
import '../view_models/detail_view_model.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieProvider());
    Get.put(DetailViewModel(), tag: '${Get.arguments.id!}');
  }
}
