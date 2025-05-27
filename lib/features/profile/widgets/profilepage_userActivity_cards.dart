import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';

class ProfilepageUseractivityCards extends StatelessWidget {
  final String title;
  final String value;

  const ProfilepageUseractivityCards({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 83,
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
                height: 1.3, // lineHeight of 21
                color: AppColors.greyTextColorTwo,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  height: 0.6, // lineHeight of 21
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
