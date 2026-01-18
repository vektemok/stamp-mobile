import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:stamp/src/core/widget/bottom_bar.dart';
import 'package:stamp/src/feature/category/provider/categories_provider.dart';
import 'package:stamp/src/feature/login/widget/login_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ref
            .watch(categoriesProvider)
            .when(
              data: (categories) {
                return ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Text(category.name);
                  },
                );
              },
              error: (_, _) {},
              loading: () {},
            ),
      ),
      backgroundColor: Colors.grey,
      bottomNavigationBar: LiquidGlassBottomBar(
        fake: true,
        glassSettings: LiquidGlassSettings(glassColor: Color(0x40ffffff)),
        extraButton: LiquidGlassBottomBarExtraButton(
          icon: CupertinoIcons.person,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          label: 'Profile',
        ),
        tabs: [
          LiquidGlassBottomBarTab(label: 'Главная', icon: CupertinoIcons.home),
          LiquidGlassBottomBarTab(
            label: 'Profile',
            icon: CupertinoIcons.person,
          ),
          LiquidGlassBottomBarTab(
            label: 'Settings',
            icon: CupertinoIcons.settings,
          ),
        ],
        selectedIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
