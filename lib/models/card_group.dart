import 'card_model.dart';

class CardGroup {
  final String designType;
  final String? name;
  final List<CardModel> cards;
  final double? height;
  final bool isScrollable;

  CardGroup({
    required this.designType,
    this.name,
    required this.cards,
    this.height,
    required this.isScrollable,
  });

  factory CardGroup.fromJson(Map<String, dynamic> json) {
    return CardGroup(
      designType: json['design_type'],
      name: json['name'],
      height: (json['height'] != null) ? (json['height'] as num).toDouble() : null,
      isScrollable: json['is_scrollable'] ?? false,
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e))
          .toList(),
    );
  }
}
