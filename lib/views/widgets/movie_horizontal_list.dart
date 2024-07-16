import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import '../../utils/constants.dart';
import 'image_error_widget.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieHorizontalList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return movies.isNotEmpty
        ? SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: movies.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 140,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Constants.imageBaseUrl}${movies[index].posterPath}',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const ImageErrorWidget(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
