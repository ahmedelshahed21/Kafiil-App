import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class AddAvatar extends StatelessWidget{
  const AddAvatar({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(ImagesApp.completeDataImage),
          backgroundColor: kPrimary100Color,
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

