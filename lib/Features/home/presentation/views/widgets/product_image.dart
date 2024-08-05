import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class ProductImage extends StatelessWidget {

  final String? image;
  final double price;

  const ProductImage({
    super.key,
    this.image,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
            child: Image.network(image??'https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg',)),
        Positioned(
          bottom: 10,
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6.0),
            decoration: BoxDecoration(
                color: kPrimary900Color,
                borderRadius: BorderRadius.circular(27)
            ),
            child: Text('\$${price.round()}',
              style: StylesApp.styleMedium12(context).copyWith(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}