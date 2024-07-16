import 'package:get/get.dart';

import '../env/env.dart';
import '../models/movie_model.dart';
import '../models/movie_response_model.dart';

class MovieProvider extends GetConnect {
  final _baseUrl = 'https://api.themoviedb.org/3/movie';

  @override
  void onInit() {
    httpClient.baseUrl = _baseUrl;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] = 'Bearer ${Env.accessToken}';
      return request;
    });
    super.onInit();
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await get(
      '/now_playing',
      query: {
        'language': 'ko-KR',
        'region': 'KR',
      },
      decoder: (json) => MovieResponseModel.fromJson(json),
    );

    if (response.statusCode == 200) {
      return response.body?.results ?? [];
    } else {
      return [];
    }
  }
}
