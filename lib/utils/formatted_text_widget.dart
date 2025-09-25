import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../models/formatted_text.dart';
import 'package:url_launcher/url_launcher.dart';

class FormattedTextWidget extends StatelessWidget {
  final FormattedText formattedText;

  const FormattedTextWidget({super.key, required this.formattedText});

  @override
  Widget build(BuildContext context) {
    final parts = formattedText.text.split('{}');
    final entities = formattedText.entities;
    final spans = <TextSpan>[];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i]));
      if (i < entities.length) {
        final entity = entities[i];
        spans.add(
          TextSpan(
            text: entity.text,
            style: TextStyle(
              color: entity.color != null ? Color(int.parse(entity.color!.replaceFirst('#', '0xff'))) : Colors.blue,
              decoration: entity.fontStyle == 'underline'
                  ? TextDecoration.underline
                  : TextDecoration.none,
              fontStyle: entity.fontStyle == 'italic'
                  ? FontStyle.italic
                  : FontStyle.normal,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (entity.url != null) launchUrl(Uri.parse(entity.url!));
              },
          ),
        );
      }
    }

    return RichText(text: TextSpan(style: DefaultTextStyle.of(context).style, children: spans));
  }
}
