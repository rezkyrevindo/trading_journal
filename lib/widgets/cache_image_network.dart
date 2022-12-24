import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageNetworkCustom extends StatelessWidget {
  final String img;
  final double? width;
  final double? height;
  const CacheImageNetworkCustom({
    super.key,
    required this.img,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.fill,
      imageUrl: img,
      progressIndicatorBuilder: (
        context,
        url,
        downloadProgress,
      ) =>
          SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: Colors.black,
        ),
      ),
      errorWidget: (
        context,
        url,
        error,
      ) =>
          const SizedBox(
        width: 60,
        height: 60,
        child: Icon(
          Icons.error,
        ),
      ),
    );
  }
}
