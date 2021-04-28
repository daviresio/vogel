import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vogel_app/core/vogel_colors.dart';
import 'package:vogel_app/core/vogel_radius.dart';

class VogelNetworkImage extends StatelessWidget {
  final String? url;
  final double width;
  final double height;
  final double radius;

  const VogelNetworkImage({
    required this.url,
    required this.width,
    required this.height,
    this.radius = VogelRadius.none,
  });

  String? validImage(String? url) {
    if (url == null) return '';
    if (!url.contains('http')) return '';

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: validImage(url)!,
        width: width,
        height: height,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: VogelColors.lightGrey,
        ),
      ),
    );
  }
}
