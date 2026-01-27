import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/Sign_up%204.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/sign_up_screen.dart';


import '../../../../core/utils/Padding.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_text_field.dart';
import 'otp_verification_screen.dart';

class SignUpCredentialsScreen extends StatefulWidget {
  const SignUpCredentialsScreen({super.key});

  @override
  State<SignUpCredentialsScreen> createState() =>
      _SignUpCredentialsScreenState();
}

class _SignUpCredentialsScreenState extends State<SignUpCredentialsScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
          child: Form(
            key: _formKey,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.10),
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
                            style: TextStyle(
                              color: AppColors.text,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Start your health journey today!",
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        CustomTextField(
                          controller: emailController,
                          hint: "Email",
                          hintColor: AppColors.text,
                          prefixIcon: const Icon(Icons.mail, color: AppColors.blueLight,),
                        ).setHorizontalAndVerticalPadding(
                            context, 0.005, 0.015),
                        CustomTextField(
                          controller: passwordController,
                          isPassword: true,
                          maxLines: 1,
                          hint: "Password",
                          hintColor: AppColors.text,
                          prefixIcon: const Icon(Icons.lock,color: AppColors.blueLight,),
                        ).setHorizontalAndVerticalPadding(
                            context, 0.005, 0.015),
                        CustomTextField(
                          controller: confirmPasswordController,
                          isPassword: true,
                          maxLines: 1,
                          hint: "Confirm Password",
                          hintColor: AppColors.text,
                          prefixIcon: const Icon(Icons.lock,color: AppColors.blueLight,),
                        ).setHorizontalAndVerticalPadding(
                            context, 0.005, 0.015),
                        const CustomTextField(
                          hint: "Phone Number",
                          hintColor: AppColors.text,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: AppColors.blueLight,
                          ),
                        ).setHorizontalAndVerticalPadding(
                            context, 0.005, 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUpScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(16),
                                backgroundColor: AppColors.blueLight,
                                elevation: 0,
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const SignUp4(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(16),
                                backgroundColor: AppColors.blueLight,
                                elevation: 0,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ).setVerticalPadding(context, 0.03),
                      ],
                    ),
                  ),
                ).setVerticalPadding(context, 0.14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
