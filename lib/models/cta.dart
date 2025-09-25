class CTA {
  final String text;
  final String? bgColor;
  final String? textColor;
  final String? url;

  CTA({
    required this.text,
    this.bgColor,
    this.textColor,
    this.url,
  });

  factory CTA.fromJson(Map<String, dynamic> json) {
    return CTA(
      text: json['text'],
      bgColor: json['bg_color'],
      textColor: json['text_color'],
      url: json['url'],
    );
  }
}
