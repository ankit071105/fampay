import 'package:flutter/material.dart';
import '../models/card_model.dart';

class HC1SmallDisplayCard extends StatelessWidget {
  final CardModel card;
  const HC1SmallDisplayCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: card.bgColor != null
          ? Color(int.parse(card.bgColor!.replaceFirst('#', '0xff')))
          : Colors.orange,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(card.title ?? ''),
        subtitle: Text(card.description ?? ''),
        onTap: () {
          if (card.url != null) debugPrint("Open ${card.url}");
        },
      ),
    );
  }
}

