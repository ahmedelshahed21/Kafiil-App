import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class AddNewImage extends StatelessWidget{
  const AddNewImage({super.key,this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: kPrimary100Color,
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

