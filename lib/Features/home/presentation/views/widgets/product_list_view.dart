import 'package:flutter/material.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return const ProductItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 7.0);
        },
      ),
    );
  }
}