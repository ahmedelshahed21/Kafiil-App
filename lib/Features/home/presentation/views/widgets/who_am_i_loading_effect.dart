import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/add_image_loading_effect.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/widgets/item_loading_effect.dart';
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
            const Row(
              children: [
                Expanded(child: ItemLoadingEffect(itemName: AppStrings.firstName)),
                SizedBox(width: 16),
                Expanded(child: ItemLoadingEffect(itemName: AppStrings.lastName)),
              ],
            ),
            const SizedBox(height: 12),
            const ItemLoadingEffect(itemName: AppStrings.email),
            const SizedBox(height: 12),
            const ItemLoadingEffect(itemName: AppStrings.password),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                AppStrings.userType,
                style: AppStyles.styleMedium12(context),
              ),
            ),
            const SizedBox(height: 14),
            Shimmer.fromColors(
              baseColor: AppColors.kGrey50Color,
              highlightColor: AppColors.kBackgroundColor,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: AppColors.kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          size: 10,
                          color: AppColors.kGrey50Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: AppColors.kGrey50Color,
                      )
                    ],
                  ),
                  const SizedBox(width: 16,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: AppColors.kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          size: 10,
                          color: AppColors.kGrey50Color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: AppColors.kGrey50Color,
                      )
                    ],
                  ),
                  const SizedBox(width: 16,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const ShapeDecoration(
                            color: AppColors.kGrey50Color,
                            shape: OvalBorder()
                        ),
                        child: const Icon(
                          FontAwesomeIcons.plus,
                          color: AppColors.kGrey50Color,
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 10,
                        width: 60,
                        color: AppColors.kGrey50Color,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ItemLoadingEffect(itemName: AppStrings.about,height: 200),
            const SizedBox(height: 12),
            const ItemLoadingEffect(itemName: AppStrings.salary),
            const SizedBox(height: 12),
            const ItemLoadingEffect(itemName: AppStrings.birthDate),
            const SizedBox(height: 50),
          ],
        ),
      ],
    );
  }
}