import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';

class SkillsSection extends StatefulWidget{

  final List skills;

  const SkillsSection({super.key, required this.skills});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            AppStrings.skills,
            style: AppStyles.styleMedium12(context),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: AppColors.kGrey50Color,
              borderRadius: BorderRadius.circular(16)
          ),
          padding: const EdgeInsets.only(top: 12,bottom: 48,left: 6.0,right: 6.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (var skill in widget.skills)
                Chip(
                  label: Text(skill.name),
                  side: const BorderSide(
                    width: 1.3,
                    color: AppColors.kPrimary100Color,
                  ),
                  onDeleted: (){
                    setState(() {
                      widget.skills.remove(skill);
                    });
                  },
                  deleteIcon: const Icon(FontAwesomeIcons.xmark,
                    size: 18,
                  ),
                  deleteIconColor: AppColors.kPrimary900Color,
                  backgroundColor: AppColors.kPrimary100Color,
                  labelStyle: AppStyles.styleMedium12(context).copyWith(
                    color: AppColors.kPrimary900Color,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}