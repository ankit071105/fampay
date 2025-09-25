import 'entity.dart';

class FormattedText {
  final String text;
  final List<Entity> entities;

  FormattedText({
    required this.text,
    required this.entities,
  });

  factory FormattedText.fromJson(Map<String, dynamic> json) {
    return FormattedText(
      text: json['text'],
      entities: (json['entities'] as List<dynamic>)
          .map((e) => Entity.fromJson(e))
          .toList(),
    );
  }
}
