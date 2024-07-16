import 'package:get/get.dart';

import '../models/movie_model.dart';

class DetailViewModel extends GetxController {
  late final MovieModel movie = Get.arguments;
}