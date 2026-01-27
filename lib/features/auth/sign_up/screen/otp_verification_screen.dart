import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/Application_Review_Page.dart';
import 'package:sijil_patient_portal/features/auth/sign_up/screen/Sign_up%204.dart';

import '../../../../core/utils/Padding.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<FocusNode> focusNodes =
  List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

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
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "Enter the code sent to your email",
                        style: TextStyle(fontSize: 20, color: AppColors.text, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ).setVerticalPadding(context, 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                              (index) => SizedBox(
                            width: width * 0.12,
                            child: TextField(
                              focusNode: focusNodes[index],
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide: const BorderSide(
                                    color: AppColors.blueLight,
                                    width: 1.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                              ),

                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  if (index < 5) {
                                    focusNodes[index + 1].requestFocus();
                                  } else {
                                    focusNodes[index].unfocus();
                                  }
                                } else {
                                  if (index > 0) {
                                    focusNodes[index - 1].requestFocus();
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ).setVerticalPadding(context, 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text(
                        "Nothing Yet?",
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend Code",
                          style: TextStyle(
                            color: AppColors.text,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.blueLight,
                          ),
                        ),
                      ),
                ]
                      ).setVerticalPadding(context, 0.01),
                      SizedBox(
                        width: width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ApplicationReviewPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.primaryColor,
                            elevation: 4,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            "Verify",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ).setVerticalPadding(context, 0.03),
                    ],
                  ),
                ),
              ).setVerticalPadding(context, 0.16),
            ),
          ),
        ),
      ),
    );
  }
}
