import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';

class HomeViewModel extends GetxController {
  final MovieProvider _provider = Get.find();

  final RxList<MovieModel> nowPlayingMovies = <MovieModel>[].obs;
  final RxList<MovieModel> popularMovies = <MovieModel>[].obs;
  final RxList<MovieModel> topRatedMovies = <MovieModel>[].obs;
  final RxList<MovieModel> upcomingMovies = <MovieModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() async {
    isLoading.value = true;
    await Future.wait([
      getNowPlayingMovies(),
      getPopularMovies(),
      getTopRatedMovies(),
      getUpcomingMovies(),
    ]);
    isLoading.value = false;

    super.onInit();
  }

  Future<void> getNowPlayingMovies() async {
    nowPlayingMovies.value = await _provider.getNowPlayingMovies();
  }

  Future<void> getPopularMovies() async {
    popularMovies.value = await _provider.getPopularMovies();
  }

  Future<void> getTopRatedMovies() async {
    topRatedMovies.value = await _provider.getTopRatedMovies();
  }

  Future<void> getUpcomingMovies() async {
    upcomingMovies.value = await _provider.getUpcomingMovies();
  }
}
