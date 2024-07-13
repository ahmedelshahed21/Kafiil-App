import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class AddNewImage extends StatefulWidget{
  const AddNewImage({super.key,this.image});
  final String? image;

  @override
  State<AddNewImage> createState() => _AddNewImageState();
}

class _AddNewImageState extends State<AddNewImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: kPrimary100Color,
          backgroundImage: AssetImage(widget.image??ImagesApp.completeDataImage),
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
  // Future<dynamic> buildImageBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //       backgroundColor: kPrimary100Color,
  //       context: context,
  //       builder: (context){
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             ImageSourceCard(
  //                 icon: Icons.camera_alt,
  //                 iconColor: Colors.white70,
  //                 onPressed: (){
  //                   pickImage(imageSource: TheImageSource.camera);
  //                 },
  //                 name: 'Camera'
  //             ),
  //             ImageSourceCard(
  //                 icon: Icons.image_rounded,
  //                 iconColor: Colors.blue.shade600,
  //                 onPressed: (){
  //                   pickImage(imageSource: TheImageSource.gallery);
  //                 },
  //                 name: 'Gallery'
  //             ),
  //           ],
  //         );
  //       }
  //   );
  // }
  //
  //
  // File image=File(ImagesApp.productImage);
  // final imagePicker=ImagePicker();
  // pickImage ({required TheImageSource imageSource}) async {
  //   XFile? pickedImage;
  //   if(imageSource==TheImageSource.camera){
  //     pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
  //   }
  //   if(imageSource==TheImageSource.gallery){
  //     pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
  //   }
  //   if(pickedImage!=null){
  //     setState(() {
  //       image = File(pickedImage!.path);
  //     });
  //   }
  // }

}

