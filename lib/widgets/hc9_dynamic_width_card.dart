import 'package:flutter/material.dart';
import '../models/card_model.dart';

class HC9DynamicWidthCard extends StatelessWidget {
  final CardModel card;
  final double height;

  const HC9DynamicWidthCard({super.key, required this.card, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: card.bgColor != null
            ? Color(int.parse(card.bgColor!.replaceFirst('#', '0xff')))
            : Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
