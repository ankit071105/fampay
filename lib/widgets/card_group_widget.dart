import 'package:flutter/material.dart';
import '../models/card_models.dart';
import 'hc1_small_display_card.dart';
import 'hc3_big_display_card.dart';
import 'hc5_image_card.dart';
import 'hc6_small_card_with_arrow.dart';
import 'hc9_dynamic_width_card.dart';

typedef DismissCallback = void Function(String cardId, bool permanent);

class CardGroupWidget extends StatelessWidget {
  final CardGroup group;
  final DismissCallback onDismiss;
  const CardGroupWidget({Key? key, required this.group, required this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cards = group.cards;
    if (cards.isEmpty) return const SizedBox.shrink();

    switch (group.designType) {
      case "HC1":
        return Column(
          children:
          cards.map((c) => HC1SmallDisplayCard(card: c, onDismiss: onDismiss)).toList(),
        );
      case "HC3":
        return Column(
          children:
          cards.map((c) => HC3BigDisplayCard(card: c, onDismiss: onDismiss)).toList(),
        );
      case "HC5":
        return Row(
          children: cards.map((c) => Expanded(child: HC5ImageCard(card: c))).toList(),
        );
      case "HC6":
        return Column(
          children:
          cards.map((c) => HC6SmallCardWithArrow(card: c)).toList(),
        );
      case "HC9":
        return SizedBox(
          height: group.height ?? 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: cards.map((c) => HC9DynamicWidthCard(card: c, parentHeight: group.height ?? 150, height: null,)).toList(),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
