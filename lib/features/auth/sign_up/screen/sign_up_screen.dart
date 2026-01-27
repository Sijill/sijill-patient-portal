import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import 'package:sijil_patient_portal/core/utils/app_style.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/signup_credentials_screen.dart';
import '../../../../core/utils/Padding.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String? gender;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.authpg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:width*0.01, vertical: 0.4 ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text("Create an Account",
                                style:AppStyle.title
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Start your health journey today!",
                                  style: AppStyle.subtitle
                                ),
                              ),
                               CustomTextField(
                                  controller: nameController,
                                  hint: "First Name",
                                  hintColor: AppColors.text,
                                  prefixIcon: Icon(Icons.person,color: AppColors.blueLight)
                                ).setVerticalPadding(context, 0.01),
                                CustomTextField(
                                  controller: nameController,
                                  hint: "Middle Name",
                                  hintColor: AppColors.text,
                                  prefixIcon: Icon(Icons.person,color: AppColors.blueLight
                                  ),
                                ).setVerticalPadding(context, 0.01),
                              CustomTextField(
                                  controller: nameController,
                                  hint: "Last Name",
                                  hintColor: AppColors.text,
                                    prefixIcon: Icon(Icons.person,color: AppColors.blueLight)
                                ).setVerticalPadding(context, 0.01),
                              DropdownButtonFormField<String>(
                                      padding: EdgeInsets.symmetric(vertical: 2),
                                      value: gender,
                                      hint: Text(
                                        "Gender",
                                        style: TextStyle(
                                          color: AppColors.text,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: AppColors.blueLight,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 14,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                            color: AppColors.blueLight,
                                            width: 1,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                            color: AppColors.blueLight,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                            color: AppColors.blueLight,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Male",
                                          child: Text("Male"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Female",
                                          child: Text("Female"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value;
                                        });
                                      },
                                    ).setVerticalPadding(context, 0.01),
                             CustomTextField(
                                  controller: dateController,
                                  hint: "Date Of Birth",
                                  hintColor: AppColors.text,
                                  enabled: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                      initialDate: DateTime.now(),
                                    );

                                    if (pickedDate != null) {
                                      dateController.text =
                                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                    }
                                  },
                                  prefixIcon: Icon(Icons.calendar_month_rounded,color: AppColors.blueLight),
                                ).setVerticalPadding(context, 0.01),
                             CustomTextField(
                                  hint: "National ID",
                                  hintColor: AppColors.text,
                                  prefixIcon: Icon(Icons.numbers_outlined,color: AppColors.blueLight,),
                                ).setVerticalPadding(context, 0.01),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const SignUpCredentialsScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: AppColors.blueLight,
                                    elevation: 0,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: AppColors.white,
                                    size: 22,
                                  ),
                                ),
                              ).setVerticalPadding(context, 0.01),
                            ]
                        ),
                      ),
                    ).setVerticalPadding(context, 0.08),
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
