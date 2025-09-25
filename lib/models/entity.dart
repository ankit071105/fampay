class Entity {
  final String text;
  final String? color;
  final String? url;
  final String? fontStyle;

  Entity({
    required this.text,
    this.color,
    this.url,
    this.fontStyle,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      text: json['text'],
      color: json['color'],
      url: json['url'],
      fontStyle: json['font_style'],
    );
  }
}
