import 'package:flutter/material.dart';

class SmashedLikeButton extends StatefulWidget {
  final bool initialIsLiked;
  final int initialLikeCount;
  final Future<void> Function(bool isLiked) onToggle;

  const SmashedLikeButton({
    Key? key,
    required this.initialIsLiked,
    required this.initialLikeCount,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<SmashedLikeButton> createState() => _SmashedLikeButtonState();
}

class _SmashedLikeButtonState extends State<SmashedLikeButton> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initialIsLiked;
    likeCount = widget.initialLikeCount;
  }

  void handleTap() async {
    final newIsLiked = !isLiked;
    setState(() {
      isLiked = newIsLiked;
      likeCount += newIsLiked ? 1 : -1;
    });

    try {
      await widget.onToggle(newIsLiked);
    } catch (e) {
      // Rollback UI if Firestore update fails
      setState(() {
        isLiked = !newIsLiked;
        likeCount += newIsLiked ? -1 : 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: 39,
        height: 22,
        padding: const EdgeInsets.fromLTRB(8, 2, 6, 2),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.pink : Color(0xff595959),
              size: 14,
            ),
            const SizedBox(width: 3),
            Text(
              '$likeCount',
              style: TextStyle(
                fontFamily: 'Instrument Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 18 / 14,
                letterSpacing: -0.14,
                color: isLiked ? Colors.pink : Color(0xff595959),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
