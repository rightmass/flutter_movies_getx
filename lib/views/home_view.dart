import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_models/home_view_model.dart';
import 'widgets/movie_carousel_slider.dart';
import 'widgets/movie_horizontal_list.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Movies',
          style: GoogleFonts.oswald(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => controller.nowPlayingMovies.isNotEmpty
                        ? MovieCarouselSlider(
                            movies: controller.nowPlayingMovies.value)
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => controller.popularMovies.isNotEmpty
                        ? MovieHorizontalList(
                            title: 'Popular',
                            movies: controller.popularMovies.value,
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => controller.topRatedMovies.isNotEmpty
                        ? MovieHorizontalList(
                            title: 'Top Rated',
                            movies: controller.topRatedMovies.value,
                          )
                        : const SizedBox.shrink(),
                  ),
                  Obx(
                    () => controller.upcomingMovies.isNotEmpty
                        ? MovieHorizontalList(
                            title: 'Upcoming',
                            movies: controller.upcomingMovies.value,
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Obx(
            () => Offstage(
              offstage: !controller.isLoading.value,
              child: const Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: ModalBarrier(
                      dismissible: false,
                      color: Colors.black,
                    ),
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
