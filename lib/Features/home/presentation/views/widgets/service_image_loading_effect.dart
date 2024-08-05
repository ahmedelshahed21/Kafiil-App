import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ServiceImageLoadingEffect extends StatelessWidget {
  const ServiceImageLoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        height: MediaQuery.sizeOf(context).height*0.11,
        decoration:ShapeDecoration(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}