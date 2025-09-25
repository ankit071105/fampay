import 'package:flutter/material.dart';
import '../models/card_model.dart';

class HC6SmallCardWithArrow extends StatelessWidget {
  final CardModel card;
  const HC6SmallCardWithArrow({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(card.title ?? ""),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
