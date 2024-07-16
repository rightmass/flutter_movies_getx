import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';

class HomeViewModel extends GetxController {
  final MovieProvider _provider = Get.find();

  final RxList<MovieModel> nowPlayingMovies = <MovieModel>[].obs;

  @override
  void onInit() async {
    await getNowPlayingMovies();
    super.onInit();
  }

  Future<void> getNowPlayingMovies() async {
    nowPlayingMovies.value = await _provider.getNowPlayingMovies();
  }
}