import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/theming/app_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.blendMode,
    this.borderReduis,
    this.errorWidget,
  });
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BlendMode? blendMode;
  final double? borderReduis;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    final child =
        imageUrl.endsWith('svg')
            ? SvgPicture.network(
              imageUrl,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return errorWidget ??
                    ColoredBox(
                      color: Co.lightGrey,
                      child: Icon(Icons.image, color: Co.grey, size: (height ?? width ?? 100) * 0.5),
                    );
              },
            )
            : CachedNetworkImage(
              imageUrl: imageUrl,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              colorBlendMode: blendMode,
              errorWidget: (context, url, error) {
                return errorWidget ??
                    ColoredBox(
                      color: Co.lightGrey,
                      child: Icon(Icons.image, color: Co.grey, size: (height ?? width ?? 100) * 0.5),
                    );
              },
            );
    return ClipRRect(borderRadius: BorderRadius.circular(borderReduis ?? 10), child: child);
  }
}
