import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_image.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/title_service_item.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/rating_section.dart';

class ServiceItem extends StatelessWidget {
  final ProductModel service;

  const ServiceItem({super.key, required this.service});

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
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Expanded(child: ServiceImage(image: service.mainImage, price: service.price)),
              Expanded(
                child: Column(
                children: [
                  TitleServiceItem(title: service.title),
                  const Spacer(),
                  RatingSection(
                      rating: service.averageRating,
                      salesCount: service.completedSalesCount),
                  const Spacer(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
