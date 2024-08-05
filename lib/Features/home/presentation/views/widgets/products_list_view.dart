import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/products_cubit/products_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final listViewHeight = screenHeight * 0.24; // Adjust this value as needed

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductsSuccessState) {
          return SizedBox(
            height: listViewHeight,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(product: state.products[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 7.0);
              },
            ),
          );
        } else if (state is ProductsFailureState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Press the button to fetch products'));
        }
      },
    );
  }
}
