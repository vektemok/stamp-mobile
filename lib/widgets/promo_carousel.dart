import 'package:flutter/material.dart';
import '../styles/color.dart';
import '../styles/typo.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({
    super.key,
    required this.items,
  });

  final List<PromoItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) => PromoCard(item: items[i]),
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key, required this.item});
  final PromoItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 135,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: purple1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                item.assetPath,
                fit: BoxFit.cover,
                width: 125,
                height: 135,
              ),
            ),
          ),

          if (item.isNew)
            Positioned(
              left: 12,
              bottom: 10,
              child: _NewBadge(),
            ),
        ],
      ),
    );
  }
}

class _NewBadge extends StatelessWidget {
  const _NewBadge();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 20,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: white,            
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1.5,                         
            color: purple1,        
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          'Новое',
          style: captionBadge.copyWith(
            color: purple1,
            height: 1.0,                       
          ),
        ),
      ),
    );
  }
}


class PromoItem {
  final String assetPath;
  final bool isNew;

  const PromoItem({
    required this.assetPath,
    this.isNew = true,
  });
}
