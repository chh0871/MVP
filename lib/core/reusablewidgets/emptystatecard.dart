import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';

class EmptyStateCard extends StatelessWidget {
  final String message;

  const EmptyStateCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              width: double.infinity,
              AppImages.empty_state_bg,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.greyTextColorTwo,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
