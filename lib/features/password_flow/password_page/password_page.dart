import 'package:cherry_mvp/core/config/app_spacing.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/features/password_flow/wigets/greeting_lable.dart';
import 'package:cherry_mvp/features/password_flow/wigets/hiddenpassoword_field.dart';
import 'package:flutter/material.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.passwordHome),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSpacing.large),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Image
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.profileImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSpacing.large), // TODO: Get from config

                    GreetingLabel(initialName: 'Romaina'),

                    SizedBox(height: AppSpacing.xl), // TODO: Get from config

                    HiddenPasswordField(),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.large),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // "Not you" Text
                  Text('Not you'),
                  // Icon Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
