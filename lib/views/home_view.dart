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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => MovieCarouselSlider(movies: controller.nowPlayingMovies.value),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Popular',
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                () => MovieHorizontalList(movies: controller.popularMovies.value),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Top Rated',
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => MovieHorizontalList(movies: controller.topRatedMovies.value),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Upcoming',
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => MovieHorizontalList(movies: controller.upcomingMovies.value),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
