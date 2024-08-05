import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_products_cubit/popular_products_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_products_cubit/popular_products_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/custom_loading_effect.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_item.dart';

class PopularServicesListView extends StatelessWidget {
  const PopularServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height*0.24;

    return BlocBuilder<PopularProductsCubit, PopularProductsState>(
      builder: (context, state) {
        if (state is PopularProductsLoadingState) {
          return SizedBox(
            height: screenHeight,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return const CustomLoadingEffect();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 7.0);
                },
                itemCount: 10
            ),
          );
        } else if (state is PopularProductsSuccessState) {
          return SizedBox(
            height: screenHeight,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.popularProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ServiceItem(service: state.popularProducts[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 7.0);
              },
            ),
          );
        } else if (state is PopularProductsFailureState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Press the button to fetch products'));
        }
      },
    );
  }
}
