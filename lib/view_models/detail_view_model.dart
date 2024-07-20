import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';

class DetailViewModel extends GetxController {
  final MovieProvider _provider = Get.find();

  late final MovieModel movie = Get.arguments;
  final RxList<MovieModel> similarMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    getSimilarMovies();
    super.onInit();
  }

  void getSimilarMovies() async {
    similarMovies.value = await _provider.getSimilarMoviesById(movie.id!);
  }
}