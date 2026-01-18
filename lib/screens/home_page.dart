import 'package:flutter/material.dart';
import 'package:stamp_mobile/widgets/qr_action_row.dart';

import '../styles/color.dart';
import '../styles/typo.dart';

import '../widgets/home_header.dart';
import '../widgets/promo_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(
              userName: 'Егор',
              location: 'Кыргызстан, Бишкек',
              onLocationTap: () {
                // открыть выбор города
              },
              onRightIconTap: () {
                // открыть поиск
              },
            ),
            ),
          SliverToBoxAdapter(
            child: QrActionRow(
              qrData: 'user-id-123', // подставить реальный ID
              scanIconAsset: 'assets/images/scan_icon.png',
              onQrTap: () {},
              onScanTap: () {},
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: softWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.only(top: 16),
            child: PromoCarousel(
              items: const [
                PromoItem(assetPath: 'assets/images/newObject1.jpg'),
                PromoItem(assetPath: 'assets/images/newObject2.jpg'),
                PromoItem(assetPath: 'assets/images/newObject3.jpg'),
              ],
            ),
          ),
          ),

          // дальше остальные секции
        ],
      ),
      ),
    );
  }
}
