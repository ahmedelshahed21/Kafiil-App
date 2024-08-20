import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/presentation/manager/services_cubit/services_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/services_cubit/services_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/services_view_loading_effect.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/service_item.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height*0.24;


    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is ServicesLoadingState) {
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
        } else if (state is ServicesSuccessState) {
          return SizedBox(
            height: screenHeight,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: state.services.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ServiceItem(service: state.services[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 7.0);
              },
            ),
          );
        } else if (state is ServicesFailureState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('There is an Error'));
        }
      },
    );
  }
}
