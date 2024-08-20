import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_image_loading_effect.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ServicesViewLoadingEffect extends StatelessWidget {
  const ServicesViewLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 192,
        maxWidth: 153,
      ),
      child: AspectRatio(
        aspectRatio: 153 / 192,
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.kBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ServiceImageLoadingEffect(),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor:AppColors.kBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black,
                        ),
                        height: 8,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 8,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: 10,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
