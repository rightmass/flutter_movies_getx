import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../view_models/detail_view_model.dart';
import 'widgets/movie_vertical_grid.dart';
import 'widgets/rounded_close_button.dart';

class DetailView extends GetView<DetailViewModel> {
  const DetailView({super.key});

  static const routeName = '/detail';

  @override
  String? get tag => '${Get.arguments.id}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              automaticallyImplyLeading: false,
              actions: const [RoundedCloseButton()],
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  controller.movie.title ?? '',
                  style: GoogleFonts.sunflower(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                background: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                      stops: [0.5, 0.9],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Constants.imageBaseUrl}${controller.movie.backdropPath}',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const SizedBox.shrink(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white10,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 14,
                          ),
                          const SizedBox(width: 2),
                          Text(
                              '${(controller.movie.voteAverage ?? 0).toStringAsFixed(1)}/10'),
                          const SizedBox(width: 2),
                          Text(
                            '(${controller.movie.voteCount ?? 0})',
                            style: const TextStyle(color: Colors.lightBlue),
                          ),
                          const Spacer(),
                          Text(controller.movie.releaseDate ?? ''),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      controller.movie.overview ?? '',
                      style: GoogleFonts.nanumGothic(fontSize: 16),
                    ),
                    const Divider(height: 40),
                    Text(
                      'Similar',
                      style: GoogleFonts.oswald(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                sliver:
                    MovieVerticalGrid(movies: controller.similarMovies.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
