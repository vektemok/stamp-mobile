import 'package:flutter/material.dart';
import 'package:stamp_mobile/widgets/qr_action_row.dart';

import '../styles/color.dart';
import '../styles/typo.dart';

import '../widgets/home_header.dart';

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
                // например открыть поиск
              },
            ),
            ),
          SliverToBoxAdapter(
            child: QrActionRow(
              qrData: 'user-id-123', // потом подставишь реальный ID/телефон/токен
              // или qrImageAsset: 'assets/images/qr_mock.png',
              scanIconAsset: 'assets/images/scan_icon.png',
              onQrTap: () {},
              onScanTap: () {},
            ),
          ),

          // дальше остальные секции
        ],
      ),
      ),
    );
  }
}
