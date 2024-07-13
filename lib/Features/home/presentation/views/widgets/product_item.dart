import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/title_product_item.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/product_image.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/rating_section.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 192,
        maxWidth: 151,
      ),
      child: AspectRatio(
        aspectRatio: 151/192,
        child: Container(
          constraints: const BoxConstraints(

          ),
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(8)
          ),
          child: const Column(
            children: [
              ProductImage(),
              TitleProductItem(),
              SizedBox(height: 10,),
              RatingSection(),
            ],
          ),
        ),
      ),
    );
  }
}