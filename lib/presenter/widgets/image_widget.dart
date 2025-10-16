import 'package:cached_network_image/cached_network_image.dart';
import 'package:caveo_gaguargo/presenter/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      filterQuality: FilterQuality.high,
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
      placeholder: (context, url) {
        return Skeleton(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          radius: 4,
        );
      },
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
