import 'package:shared_preferences/shared_preferences.dart';
import '../models/card_models.dart';

class StorageHelper {
  static const _dismissedKey = 'dismissed_cards';

  static Future<List<CardGroup>> filterDismissed(List<CardGroup> groups) async {
    final prefs = await SharedPreferences.getInstance();
    final dismissed = prefs.getStringList(_dismissedKey) ?? [];
    return groups
        .map((g) => g.copyWith(
        cards: g.cards.where((c) => !dismissed.contains(c.id)).toList()))
        .toList();
  }

  static Future<void> dismissForever(String cardId) async {
    final prefs = await SharedPreferences.getInstance();
    final dismissed = prefs.getStringList(_dismissedKey) ?? [];
    if (!dismissed.contains(cardId)) {
      dismissed.add(cardId);
      await prefs.setStringList(_dismissedKey, dismissed);
    }
  }
}
