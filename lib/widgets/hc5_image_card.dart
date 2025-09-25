import 'package:flutter/material.dart';
import '../models/card_model.dart';

class HC5ImageCard extends StatelessWidget {
  final CardModel card;
  const HC5ImageCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: Image.network(
          card.url ?? "https://via.placeholder.com/200",
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
