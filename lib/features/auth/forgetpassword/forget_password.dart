import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/core/utils/app_colors.dart';
import '../../../core/utils/Padding.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.authpg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            title: Text(
                "Forget Password",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: AppColors.blueLight,
            ),
          ),
        body: SafeArea(
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
                  padding: EdgeInsets.symmetric(horizontal:width*0.01, vertical: 0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child:
                        Image.asset(
                          "assets/images/forget_password.jpg",
                        ),
                      ),
                      const CustomTextField(
                        hint: "Email",
                        hintColor: AppColors.text,
                        prefixIcon: Icon(
                        Icons.mail,
                          color: AppColors.blueLight,
                        ),
                      ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.blueLight,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                              side: BorderSide(
                                color: AppColors.blueLight,
                              )
                            )
                        ),
                        child: Text(
                          "Verify Email",
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                          ),
                        ).setVerticalPadding(context, 0.015),
                      ).setVerticalPadding(context, 0.025).setVerticalPadding(context, 0.01),
                    ],
                  ),
                ),
              ).setVerticalPadding(context, 0.12),
            ),
          ),
        )
      ),
    );
  }
}
