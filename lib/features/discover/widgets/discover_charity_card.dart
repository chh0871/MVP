import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';

const hasUserLiked = false;

class DiscoverCharityCard extends StatefulWidget {
  const DiscoverCharityCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.logoPath,
    required this.likes,
  });

  final String title;
  final String description;
  final String imagePath;
  final String logoPath;
  final int likes;

  @override
  DiscoverCharityCardState createState() => DiscoverCharityCardState();
}

class DiscoverCharityCardState extends State<DiscoverCharityCard> {
  bool isLiked = hasUserLiked;

  void toggleLiked() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(widget.imagePath),
            Positioned(
              width: 50,
              height: 40,
              bottom: 5,
              left: 5,
              child: Image.asset(widget.logoPath),
            ),
            Positioned(
              width: 35,
              height: 25,
              bottom: 9,
              right: 9,
              child: GestureDetector(
                  onTap: toggleLiked,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.lightGreyFill,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                            isLiked
                                ? AppImages.likeHeart
                                : AppImages.emptyHeart,
                            width: 15,
                            height: 11),
                        SizedBox(width: 5),
                        Text(
                          '${widget.likes}',
                          style: TextStyle(fontFamily: "InstrumentSans"),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(height: 9),
        Text(widget.title, style: AppTextStyles.charityHeadingText),
        Text(widget.description, style: AppTextStyles.charityBodyText),
      ],
    );
  }
}
