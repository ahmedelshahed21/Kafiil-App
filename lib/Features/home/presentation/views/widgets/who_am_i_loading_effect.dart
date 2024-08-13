import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/add_image_loading_effect.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';
import 'package:shimmer/shimmer.dart';

class WhoAmILoadingEffect extends StatelessWidget {
  const WhoAmILoadingEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: AddNewImageLoadingEffect()),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',
                        style: StylesApp.styleMedium12(context),
                      ),
                      const SizedBox(height: 5.0),
                      Shimmer.fromColors(
                        baseColor: kGrey50Color,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kGrey50Color
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name',
                        style: StylesApp.styleMedium12(context),
                      ),
                      const SizedBox(height: 5.0),
                      Shimmer.fromColors(
                        baseColor: kGrey50Color,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kGrey50Color
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email Address',
                  style: StylesApp.styleMedium12(context),
                ),
                const SizedBox(height: 5.0),
                Shimmer.fromColors(
                  baseColor: kGrey50Color,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kGrey50Color
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Password',
                  style: StylesApp.styleMedium12(context),
                ),
                const SizedBox(height: 5.0),
                Shimmer.fromColors(
                  baseColor: kGrey50Color,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kGrey50Color
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'User Type',
                style: StylesApp.styleMedium12(context),
              ),
            ),
            const SizedBox(height: 14),
            Shimmer.fromColors(
              baseColor: kGrey50Color,
              highlightColor: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          size: 10,
                          color: kGrey50Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: kGrey50Color,
                      )
                    ],
                  ),
                  const SizedBox(width: 16,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          size: 10,
                          color: kGrey50Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: kGrey50Color,
                      )
                    ],
                  ),
                  const SizedBox(width: 16,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          color: kGrey50Color,
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: kGrey50Color,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About',
                  style: StylesApp.styleMedium12(context),
                ),
                const SizedBox(height: 5.0),
                Shimmer.fromColors(
                  baseColor: kGrey50Color,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kGrey50Color
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}