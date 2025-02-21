import 'package:cherry_mvp/core/reusablewidgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/core/router/router.dart';
import 'package:cherry_mvp/core/config/config.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the NavigatorService
    final navigator = Provider.of<NavigationProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),


            Text(
              AppStrings.welcome,
              style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold).copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),

            Spacer(),

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
                  Image(
                    image: AssetImage(AppImages.icButton),
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
