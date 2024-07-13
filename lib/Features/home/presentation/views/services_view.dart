import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:kafiil_app/features/home/presentation/views/widgets/product_list_view.dart';

class ServicesView extends StatelessWidget{
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 63),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Services', style: StylesApp.styleSemiBold18(context)),
            const SizedBox(height: 50),
            const ProductsListView(),
            const SizedBox(height: 35),
            Text('Popular Services', style: StylesApp.styleSemiBold18(context)),
            const SizedBox(height: 30),
            const ProductsListView()
          ],
        ),
      ),
    );
  }
}









