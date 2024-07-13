import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImagesApp.productImage),
        Positioned(
          bottom: 10,
          left: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6.0),
            decoration: BoxDecoration(
                color: kPrimary900Color,
                borderRadius: BorderRadius.circular(27)
            ),
            child: Text(r'$100',
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