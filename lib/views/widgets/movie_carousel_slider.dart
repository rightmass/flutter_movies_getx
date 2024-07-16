import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import '../../utils/constants.dart';

class MovieCarouselSlider extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieCarouselSlider({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return movies.isNotEmpty
        ? CarouselSlider.builder(
            itemCount: movies.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${Constants.imageBaseUrl}${movies[index].posterPath}',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, size: 40),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 0.9,
              enlargeFactor: 0.2,
              viewportFraction: 0.75,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
            ),
          )
        : Container();
  }
}
