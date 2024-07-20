import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/movie_model.dart';
import '../../utils/constants.dart';
import '../detail_view.dart';
import 'image_error_widget.dart';

class MovieVerticalGrid extends StatelessWidget {
  final List<MovieModel> movies;

  const MovieVerticalGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: movies.length,
        (context, index) {
          return GestureDetector(
            onTap: () =>
                Get.toNamed(DetailView.routeName, arguments: movies[index], preventDuplicates: false),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
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
          );
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: 0.7,
      ),
    );
  }
}
