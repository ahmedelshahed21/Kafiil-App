import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/grey_container.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class SalarySection extends StatefulWidget{
  const SalarySection({super.key});

  @override
  State<SalarySection> createState() => _SalarySectionState();
}

class _SalarySectionState extends State<SalarySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.salary,
          style: AppStyles.styleMedium12(context),
        ),
        const SizedBox(height: 5),
        GreyContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomFloatingActionButton(
                  heroTag: 'minus',
                  onPressed: () {
                    setState(() {
                      if (counter > 100) {
                        counter -= 100;
                      }
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.minus,
                    color: AppColors.kPrimary900Color,
                    size: 20,
                  )),
              Text(
                '${AppStrings.sar} $counter',
                style: AppStyles.styleMedium16(context).copyWith(
                  color: AppColors.kGrey800Color,
                ),
              ),
              CustomFloatingActionButton(
                  heroTag: 'plus',
                  onPressed: () {
                    setState(() {
                      if (counter < 1000) {
                        counter += 100;
                      }
                    });
                  },
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    color: AppColors.kPrimary900Color,
                    size: 20,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}