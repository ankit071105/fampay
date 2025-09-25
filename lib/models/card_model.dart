import 'formatted_text.dart';
import 'cta.dart';

class CardModel {
  final String? name;
  final FormattedText? formattedTitle;
  final String? title;
  final FormattedText? formattedDescription;
  final String? description;
  final String? url;
  final String? bgColor;
  final List<CTA> ctas;

  CardModel({
    this.name,
    this.formattedTitle,
    this.title,
    this.formattedDescription,
    this.description,
    this.url,
    this.bgColor,
    required this.ctas,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'],
      formattedTitle: json['formatted_title'] != null
          ? FormattedText.fromJson(json['formatted_title'])
          : null,
      title: json['title'],
      formattedDescription: json['formatted_description'] != null
          ? FormattedText.fromJson(json['formatted_description'])
          : null,
      description: json['description'],
      url: json['url'],
      bgColor: json['bg_color'],
      ctas: json['cta'] != null
          ? (json['cta'] as List).map((e) => CTA.fromJson(e)).toList()
          : [],
    );
  }
}
