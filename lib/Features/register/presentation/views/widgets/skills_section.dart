import 'package:flutter/material.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/clickable_container.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/models/dependencies_model.dart';
import 'package:kafiil_app/core/repos/dependencies_repo.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:http/http.dart' as http;


class SkillsSection2 extends StatefulWidget{
  const SkillsSection2({super.key});
  @override
  State<SkillsSection2> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection2> {
  late DependenciesRepoImpl dependenciesRepo;
  late DependenciesModel? dependencies;
  bool isLoading = true;
  String? errorMessage;


  @override
  void initState() {
    super.initState();
    dependenciesRepo = DependenciesRepoImpl(
      apiUrl: 'https://test.kafiil.com/api/test/dependencies',
      httpClient: http.Client(),
    );
    _fetchDependencies();
  }

  Future<void> _fetchDependencies() async {
    try {
      final result = await dependenciesRepo.fetchDependencies();
      setState(() {
        dependencies = result;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = error.toString();
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    List<MultiSelectItem<String>> skillItems = dependencies!.tags
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
          height: 12,
        ),
        ClickableContainer(
          child: Column(
            children: [
              MultiSelectDialogField(
                buttonIcon: const Icon(
                  Icons.account_circle_sharp,
                  color: AppColors.kGrey50Color,
                ),
                backgroundColor: AppColors.kPrimary100Color,
                selectedColor: AppColors.kPrimary900Color,
                title: Text(AppStrings.skills,
                  style: AppStyles.styleSemiBold18(context).copyWith(fontSize: 24),
                ),
                buttonText: Text(
                  "Select",
                  style: AppStyles.styleMedium12(context).copyWith(color: AppColors.kGrey50Color),
                ),
                items: skillItems,
                onConfirm: (values) {
                  setState(() {
                    selectedSkills = values.cast<String>();
                    if (dependencies != null) {
                      for (int i = 0; i < dependencies!.tags.length; i++) {
                        if (selectedSkills.contains(dependencies!.tags[i].label)) {
                          tags.add(dependencies!.tags[i].value);
                        }
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
                      selectedSkills.remove(value);
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
  }
}