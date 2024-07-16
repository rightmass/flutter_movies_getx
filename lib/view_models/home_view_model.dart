import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../providers/movie_provider.dart';

class HomeViewModel extends GetxController {
  final MovieProvider _provider = Get.find();

  final RxList<MovieModel> nowPlayingMovies = <MovieModel>[].obs;
  final RxList<MovieModel> popularMovies = <MovieModel>[].obs;
  final RxList<MovieModel> topRatedMovies = <MovieModel>[].obs;
  final RxList<MovieModel> upcomingMovies = <MovieModel>[].obs;

  @override
  void onInit() async {
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
    getUpcomingMovies();
    super.onInit();
  }

  void getNowPlayingMovies() async {
    nowPlayingMovies.value = await _provider.getNowPlayingMovies();
  }

  void getPopularMovies() async {
    popularMovies.value = await _provider.getPopularMovies();
  }

  void getTopRatedMovies() async {
    topRatedMovies.value = await _provider.getTopRatedMovies();
  }

  void getUpcomingMovies() async {
    upcomingMovies.value = await _provider.getUpcomingMovies();
  }
}
