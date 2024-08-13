import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class AddNewImageLoadingEffect extends StatelessWidget{
  const AddNewImageLoadingEffect({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: kGrey50Color,
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
              backgroundColor: kPrimary900Color,
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

