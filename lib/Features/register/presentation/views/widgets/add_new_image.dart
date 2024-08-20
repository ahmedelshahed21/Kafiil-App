import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';


class AddNewImage extends StatelessWidget{
  const AddNewImage({super.key,this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.kGrey50Color,
          backgroundImage: NetworkImage(image??''),
          radius: 41.5,
        ),
        Positioned(
          bottom: 2,
          left: 58,
          child: GestureDetector(
            onTap: (){
              //buildImageBottomSheet(context);
            },
            child: const CircleAvatar(
              backgroundColor: AppColors.kPrimary900Color,
              radius: 12,
              child: Icon(Icons.add,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}

