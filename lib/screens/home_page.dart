import 'package:flutter/material.dart';

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

          // дальше остальные секции
        ],
      ),
      ),
    );
  }
}
