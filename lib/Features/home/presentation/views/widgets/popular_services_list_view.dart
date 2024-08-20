import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_services_cubit/popular_services_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_services_cubit/popular_services_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/services_view_loading_effect.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_item.dart';

class PopularServicesListView extends StatelessWidget {
  const PopularServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height*0.24;

    return BlocBuilder<PopularServicesCubit, PopularServicesState>(
      builder: (context, state) {
        if (state is PopularServicesLoadingState) {
          return SizedBox(
            height: screenHeight,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return const ServicesViewLoadingEffect();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 7.0);
                },
                itemCount: 10
            ),
          );
        } else if (state is PopularServicesSuccessState) {
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
          return const Center(child: Text('There is an Error'));
        }
      },
    );
  }
}
