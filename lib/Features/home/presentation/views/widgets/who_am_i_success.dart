// import 'package:flutter/material.dart';
// import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';
// import 'package:kafiil_app/Features/home/presentation/views/widgets/name_section.dart';
// import 'package:kafiil_app/Features/home/presentation/views/widgets/user_type_section.dart';
// import 'package:kafiil_app/Features/register/presentation/views/widgets/add_new_image.dart';
// import 'package:kafiil_app/core/constants/app_strings.dart';
// import 'package:kafiil_app/core/theme/app_colors.dart';
// import 'package:kafiil_app/core/utils/widgets/custom_text_form_field.dart';
//
// class WhoAmISuccess extends StatelessWidget{
//
//   final WhoAmIModel whoAmI;
//   const WhoAmISuccess({super.key, required this.whoAmI});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Center(child: AddNewImage(image: whoAmI.avatar)),
//         const SizedBox(height: 30),
//         NameSection(
//           firstNameInitialValue: whoAmI.firstName,
//           lastNameInitialValue: whoAmI.lastName,
//         ),
//         const SizedBox(height: 12),
//         CustomTextFormField(
//           fieldName: AppStrings.email,
//           initialValue: whoAmI.email,
//           maxLength: 240,
//           validator: (v) {
//             return null;
//           },
//         ),
//         const SizedBox(height: 12),
//         CustomTextFormField(
//           fieldName: AppStrings.password,
//           initialValue: '01068192572',
//           suffixIcon: IconButton(
//             icon: isSecure
//                 ? const Icon(
//               Icons.visibility_off_outlined,
//               color: AppColors.kGrey400Color,
//             )
//                 : const Icon(
//               Icons.remove_red_eye_outlined,
//               color: AppColors.kGrey400Color,
//             ),
//             onPressed: () {
//               setState(() {
//                 isSecure = !isSecure;
//               });
//             },
//           ),
//           obscureText: isSecure,
//           validator: (v) {
//             return null;
//           },
//         ),
//         const SizedBox(height: 12),
//         UserTypeSection(
//           userType: userType,
//           userTypeOnChanged: (value){
//             userType=value!;
//           },
//         ),
//         const SizedBox(height: 12),
//         CustomTextFormField(
//           fieldName: 'About',
//           initialValue: whoAmI.about,
//           minLines: 4,
//           maxLength: 1200,
//           validator: (v) {
//             return null;
//           },
//           maxLines: 4,
//         ),
//         const SizedBox(height: 12),
//         CustomTextFormField(
//           fieldName: AppStrings.salary,
//           prefix: const Text('SAR '),
//           validator: (v) {
//             return null;
//           },
//           initialValue: whoAmI.salary.toString(),
//           contentPadding: const EdgeInsets.only(left: 40, top: 18, bottom: 18),
//         ),
//         const SizedBox(height: 12),
//         CustomTextFormField(
//           fieldName: AppStrings.birthDate,
//           hintText: whoAmI.birthDate,
//           controller: _birthdateController,
//           onTap: () async {
//             DateTime? pickedDate = await showDatePicker(
//               context: context,
//               initialDate: DateTime.now(),
//               firstDate: DateTime(1900),
//               lastDate: DateTime.now(),
//             );
//             if (pickedDate != null) {
//               setState(() {
//                 _birthdateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//               });
//             }
//           },
//           suffixIcon: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: SvgPicture.asset(AppAssets.calendarIcon),
//           ),
//           readOnly: true,
//         ),
//         const SizedBox(height: 12.0),
//         GenderSection(
//           gender: gender,
//           genderOnChange: (value){
//             gender=value!;
//           },
//         ),
//         const SizedBox(height: 12.0),
//         SkillsSection(skills: state.whoAmI.tags),
//         const SizedBox(height: 12.0),
//         FavouriteSocialMediaSection(
//           isFacebookSelected: isFacebookSelected,
//           isXSelected: isXSelected,
//           isInstagramSelected: isInstagramSelected,
//           onChange: (value){
//             isFacebookSelected=value!;
//             isXSelected=value;
//             isInstagramSelected=value;
//           },
//         ),
//         const SizedBox(height: 50),
//       ],
//     );
//   }
// }