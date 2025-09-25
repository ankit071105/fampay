import 'package:flutter/material.dart';
import '../models/card_model.dart';

class HC3BigDisplayCard extends StatefulWidget {
  final CardModel card;
  final VoidCallback onRemindLater;
  final VoidCallback onDismissNow;

  const HC3BigDisplayCard({
    super.key,
    required this.card,
    required this.onRemindLater,
    required this.onDismissNow,
  });

  @override
  State<HC3BigDisplayCard> createState() => _HC3BigDisplayCardState();
}

class _HC3BigDisplayCardState extends State<HC3BigDisplayCard> {
  bool _longPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() => _longPressed = !_longPressed),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.card.bgColor != null
                  ? Color(int.parse(widget.card.bgColor!.replaceFirst('#', '0xff')))
                  : Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.card.title ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(widget.card.description ?? "",
                    style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 16),
                if (widget.card.ctas.isNotEmpty)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(widget.card.ctas.first.text),
                  ),
              ],
            ),
          ),
          if (_longPressed)
            Positioned(
              left: 0,
              top: 20,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: widget.onRemindLater,
                    icon: const Icon(Icons.notifications),
                    label: const Text("Remind later"),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: widget.onDismissNow,
                    icon: const Icon(Icons.cancel),
                    label: const Text("Dismiss now"),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
