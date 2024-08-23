import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/register/presentation/manager/dependencies_cubit/user_types_cubit/user_types_cubit.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/core/constants/app_strings.dart';
import 'package:kafiil_app/core/data/models/dependencies_model.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/theme/app_styles.dart';
import 'package:kafiil_app/core/utils/helpers/functions/outline_input_border.dart';
import 'package:kafiil_app/core/widgets/item_loading_effect.dart';



class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({super.key});

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTypesCubit, UserTypesState>(
      builder: (context, state) {
        if (state is DependenciesLoading) {
          return const ItemLoadingEffect(itemName: AppStrings.userType,height: 55);
        } else if (state is DependenciesError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is DependenciesLoaded) {
          final userTypes = state.dependencies.types;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'User Type',
                style: AppStyles.styleMedium12(context),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.kGrey50Color,
                  enabledBorder: buildOutlineInputBorder(),
                  focusedBorder: buildOutlineInputBorder(),
                  errorBorder: buildOutlineInputBorder(color: Colors.red),
                  focusedErrorBorder: buildOutlineInputBorder(color: Colors.red),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                ),
                icon: Transform.rotate(
                  angle: -1.59,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.kGrey300Color,
                  ),
                ),
                items: userTypes.map((TypeModel type) {
                  return DropdownMenuItem<String>(
                    value: type.label,
                    child: Text(
                      type.label,
                      style: AppStyles.styleMedium16(context).copyWith(
                        color: AppColors.kGrey800Color,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    for(int i=0;i<state.dependencies.types.length;i++){
                      if (newValue == state.dependencies.types[i].label) {
                        userProfile.userTypeValue = state.dependencies.types[i].value;
                      }
                    }
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'User type is required';
                  }
                  return null;
                },
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
