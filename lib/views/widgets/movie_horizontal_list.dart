import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/movie_model.dart';
import '../../utils/constants.dart';
import '../detail_view.dart';
import 'image_error_widget.dart';

class MovieHorizontalList extends StatelessWidget {
  final String? title;
  final List<MovieModel> movies;

  const MovieHorizontalList({
    super.key,
    this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (title ?? '').isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 8),
                child: Text(
                  title!,
                  style: GoogleFonts.oswald(fontSize: 20),
                ),
              )
            : const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    Get.toNamed(DetailView.routeName, arguments: movies[index], preventDuplicates: false),
                child: Padding(
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
              );
            },
          ),
        ),
      ],
    );
  }
}
