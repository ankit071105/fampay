import 'dart:convert';
import 'package:crypto/crypto.dart';

class CardGroup {
  final String designType;
  final List<CardModel> cards;
  final double? height;
  final bool isScrollable;

  CardGroup({
    required this.designType,
    required this.cards,
    this.height,
    this.isScrollable = false,
  });

  factory CardGroup.fromJson(Map<String, dynamic> json) {
    return CardGroup(
      designType: json['design_type'] ?? '',
      height: (json['height'] as num?)?.toDouble(),
      isScrollable: json['is_scrollable'] ?? false,
      cards: (json['cards'] as List?)
          ?.map((e) => CardModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  CardGroup copyWith({List<CardModel>? cards}) {
    return CardGroup(
      designType: designType,
      height: height,
      isScrollable: isScrollable,
      cards: cards ?? this.cards,
    );
  }
}

class CardModel {
  final String id;
  final String? title;
  final String? description;
  final String? url;
  final String? bgColor;
  final List<CTA> cta;

  CardModel({
    required this.id,
    this.title,
    this.description,
    this.url,
    this.bgColor,
    this.cta = const [],
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    final raw = jsonEncode(json);
    final id = sha1.convert(utf8.encode(raw)).toString();
    return CardModel(
      id: id,
      title: json['title'],
      description: json['description'],
      url: json['url'],
      bgColor: json['bg_color'],
      cta: (json['cta'] as List?)
          ?.map((e) => CTA.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class CTA {
  final String text;
  final String? url;
  final String? bgColor;
  final String? textColor;

  CTA({required this.text, this.url, this.bgColor, this.textColor});

  factory CTA.fromJson(Map<String, dynamic> json) {
    return CTA(
      text: json['text'] ?? '',
      url: json['url'],
      bgColor: json['bg_color'],
      textColor: json['text_color'],
    );
  }
}
