import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/product_image.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/title_product_item.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/rating_section.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

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
              Expanded(child: ProductImage(image: product.mainImage,price: product.price)),
              Expanded(
                  child: Column(
                children: [
                  TitleProductItem(title: product.title),
                  const Expanded(child: SizedBox(height: 10)),
                  RatingSection(rating:product.averageRating,salesCount:product.completedSalesCount),
                  const Expanded(child: SizedBox(height: 10)),
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }
}
