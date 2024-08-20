import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_image_loading_effect.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class ServiceImage extends StatelessWidget {
  final String? image;
  final double price;

  const ServiceImage({
    super.key,
    this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: image ??
                'https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg',
            placeholder: (context, url) => const ServiceImageLoadingEffect(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
            decoration: BoxDecoration(
              color: AppColors.kPrimary900Color,
              borderRadius: BorderRadius.circular(27),
            ),
            child: Text(
              '\$${price.round()}',
              style: AppStyles.styleMedium12(context).copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
