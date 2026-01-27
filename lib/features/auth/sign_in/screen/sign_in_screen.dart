import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/sign_up_screen.dart';
import '../../../../core/utils/Padding.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/custom_text_field.dart';
import '../../forgetpassword/forget_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;
  bool rememberMe = false;

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
                      padding: EdgeInsets.symmetric(horizontal:width*0.03, vertical: height*0.1 ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text("Welcome Back 👋",
                              style:
                              TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text("Sign in to continue your health journey today!",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          CustomTextField(
                            controller: _emailController,
                            hint: "Email",
                            hintColor: AppColors.text,
                            prefixIcon: Icon(
                                Icons.mail,
                              color: AppColors.blueLight,
                            ),
                          ).setOnlyPadding(context, 0.03, 0.015, 0.0, 0.0),
                          CustomTextField(
                            controller: _passwordController,
                            isPassword: true,
                            maxLines: 1,
                            hint: "Password",
                            hintColor: AppColors.text,
                            prefixIcon:
                            Icon(
                                Icons.lock,
                              color: AppColors.blueLight,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Checkbox(
                                      value: rememberMe,
                                      activeColor: AppColors.blueLight,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      color: AppColors.text,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const ForgetPassword(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(
                                    color: AppColors.blueLight,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.blueLight,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ElevatedButton(onPressed: (){
                            },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppColors.blueLight,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: const BorderSide(
                                          color:  AppColors.blueLight,
                                        )
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Submit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          fontSize: 18
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have account ?",
                                style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text("Create account",
                                    style: TextStyle(
                                      color: AppColors.blueLight,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.blueLight,
                                    ),
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).setVerticalPadding(context, 0.12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}