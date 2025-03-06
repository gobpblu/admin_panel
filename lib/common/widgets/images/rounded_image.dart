import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_panel/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'image_type.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.image,
    this.file,
    this.border,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    this.overlayColor,
    required this.imageType,
    this.backgroundColor,
    this.padding = AppSizes.sm,
    this.margin,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius = AppSizes.md,
  });

  final bool applyImageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    final imageWidget = switch (imageType) {
      ImageType.network => _buildNetworkImage(),
      ImageType.memory => _buildMemoryImage(),
      ImageType.file => _buildFileImage(),
      ImageType.asset => _buildAssetImage(),
    };

    return ClipRRect(
      borderRadius: applyImageRadius
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.zero,
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overlayColor,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // progressIndicatorBuilder: (context, url, progress) =>
            // ShimmerEffect(width: width, height: height),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      return Image(
        image: FileImage(file!),
        fit: fit,
        color: overlayColor,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildAssetImage() {
    if (image != null) {
      return Image(image: AssetImage(image!), fit: fit, color: overlayColor);
    } else {
      return const SizedBox();
    }
  }
}
