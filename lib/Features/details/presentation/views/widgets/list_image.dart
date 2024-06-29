import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListImage extends StatelessWidget {
  final List<String> images;

  const ListImage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 70,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: images[index],
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
