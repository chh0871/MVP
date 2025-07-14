import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:flutter/material.dart';

class UserOrderTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String assetPath;

  const UserOrderTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: 95,
          decoration: BoxDecoration(
            color: AppColors.lightGreyFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 1.3,
                    color: AppColors.greyTextColorTwo,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    assetPath,
                    height: 18,
                    width: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
