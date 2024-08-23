import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/register/presentation/manager/dependencies_cubit/skills_cubit/skills_cubit.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/grey_container.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/data/repos/dependencies_repo.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/widgets/item_loading_effect.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SkillsSection2 extends StatefulWidget {
  const SkillsSection2({super.key});
  @override
  State<SkillsSection2> createState() => _SkillsSection2State();
}

class _SkillsSection2State extends State<SkillsSection2> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SkillsCubit(DependenciesRepoImpl())..fetchDependencies(),
      child: BlocBuilder<SkillsCubit, SkillsState>(
        builder: (context, state) {
          if (state is SkillsLoading) {
            return const ItemLoadingEffect(itemName: AppStrings.skills);
          } else if (state is SkillsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is SkillsLoaded) {
            List<MultiSelectItem<String>> skillItems = state.dependencies.tags
                .map((tag) => MultiSelectItem<String>(tag.label, tag.label))
                .toList();
            return Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    AppStrings.skills,
                    style: AppStyles.styleMedium12(context),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                GreyContainer(
                  child: Column(
                    children: [
                      MultiSelectDialogField(
                        buttonIcon: const Icon(
                          Icons.account_circle_sharp,
                          color: AppColors.kGrey50Color,
                        ),
                        backgroundColor: AppColors.kPrimary100Color,
                        selectedColor: AppColors.kPrimary900Color,
                        title: Text(
                          AppStrings.skills,
                          style: AppStyles.styleSemiBold18(context).copyWith(fontSize: 24),
                        ),
                        buttonText: Text(
                          "Select",
                          style: AppStyles.styleMedium12(context)
                              .copyWith(color: AppColors.kGrey50Color),
                        ),
                        items: skillItems,
                        onConfirm: (values) {
                          setState(() {
                            userProfile.selectedSkills = values.cast<String>();
                              for (int i = 0; i < state.dependencies.tags.length; i++) {
                                if (userProfile.selectedSkills.contains(state.dependencies.tags[i].label)) {
                                  userProfile.tags.add(state.dependencies.tags[i].value);
                                }
                              }

                          });
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          chipColor: AppColors.kPrimary100Color,
                          textStyle: AppStyles.styleMedium12(context)
                              .copyWith(color: AppColors.kPrimary900Color,),
                          onTap: (value) {
                            setState(() {
                              userProfile.selectedSkills.remove(value);
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.skillsIsRequired;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        itemsTextStyle: AppStyles.styleMedium12(context)
                            .copyWith(color: AppColors.kPrimary900Color,),
                        selectedItemsTextStyle: AppStyles.styleMedium12(context)
                            .copyWith(color: AppColors.kPrimary900Color,),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
