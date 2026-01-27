import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sijil_patient_portal/features/auth/sign_in/screen/sign_in_screen.dart';

import '../../../../core/utils/Padding.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class ApplicationReviewPage extends StatelessWidget {
  const ApplicationReviewPage({super.key});

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
                  padding: EdgeInsets.symmetric(horizontal:width*0.01, vertical: height*0.04 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ).setVerticalPadding(context, 0.01),
                      const Text(
                        "Your Application Is Being Reviewed\nCheck Your Accounts For Updates\nEstimate Review Time: 2 Hours",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          height: 1.5,
                        ),
                      ).setVerticalPadding(context, 0.01),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueLight,
                          foregroundColor: Colors.black,
                          side: const BorderSide(color: AppColors.blueLight),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        ),
                        child: const Text("OK",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      ).setVerticalPadding(context, 0.03),
                    ],
                  ),
                ),
              ).setHorizontalAndVerticalPadding(context, 0.060, 0.15),
            ),
          ),
        ),
      ),
    );
  }
}

