import 'package:cherry_mvp/core/reusablewidgets/loading_view.dart';
import 'package:cherry_mvp/core/reusablewidgets/primary_button.dart';
import 'package:cherry_mvp/core/utils/status.dart';
import 'package:cherry_mvp/features/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/core/router/router.dart';
import 'package:cherry_mvp/core/config/config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.welcomeBg,
              fit: BoxFit.cover,
            ),
          ),

          // Centered Welcome Text
          Center(
            child: Text(
              AppStrings.welcome,
              style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Sign-In with Google & Apple
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, child) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (viewModel.status.type == StatusType.failure) {
                        Fluttertoast.showToast(
                            msg: viewModel.status.message ?? "");
                      } else if (viewModel.status.type == StatusType.success) {
                        Fluttertoast.showToast(msg: "Login Successful");
                        //move to home
                        navigator.replaceWith(AppRoutes.home);
                      }
                    });

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        viewModel.status.type == StatusType.loading
                            ? const LoadingView()
                            : GestureDetector(
                                onTap: () {
                                  viewModel.signInWithGoogle();
                                },
                                child: Image.asset(
                                  AppImages.googleSignIn,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 20),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: PrimaryAppButton(
                    onPressed: () {
                      navigator.replaceWith(AppRoutes.login);
                    },
                    buttonText: AppStrings.login,
                  ),
                ),

                const SizedBox(height: 30),

                // Register Button
                GestureDetector(
                  onTap: () {
                    navigator.replaceWith(AppRoutes.register);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.create_account,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: AppColors.black),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        AppImages.icButton,
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
