import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view_models/home_view_model.dart';
import 'widgets/movie_carousel_slider.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Movies',
          style: GoogleFonts.calligraffitti(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => MovieCarouselSlider(movies: controller.nowPlayingMovies.value),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
