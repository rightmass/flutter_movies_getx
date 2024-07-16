import 'package:get/get.dart';

import '../providers/movie_provider.dart';
import '../view_models/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieProvider());
    Get.put(HomeViewModel());
  }
}
