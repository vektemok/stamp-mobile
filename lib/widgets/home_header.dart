import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/typo.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.userName = 'Егор',
    this.location = 'Кыргызстан, Бишкек',
    this.onLocationTap,
    this.onRightIconTap,
  });

  final String userName;
  final String location;
  final VoidCallback? onLocationTap;
  final VoidCallback? onRightIconTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
            width: 185,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Доброе утро, $userName',
                  style: displayGreeting,
                ),
                const SizedBox(height: 2),
                InkWell(
                  onTap: onLocationTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(location, style: displayLocation), 
                        const SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                          color: softWhite2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),

          const SizedBox(width: 8),
          IconButton(
            onPressed: onRightIconTap,
            icon: const Icon(Icons.search),
            color: white,
            iconSize: 24,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
          ),
        ],
      ),
    );
  }
}
