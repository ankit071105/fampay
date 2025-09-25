import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/card_models.dart';
import 'widgets/card_group_widget.dart';
import 'utils/storage_helper.dart';

class ContextualCardsContainer extends StatefulWidget {
  final String apiUrl;
  const ContextualCardsContainer({Key? key, required this.apiUrl})
      : super(key: key);

  @override
  State<ContextualCardsContainer> createState() =>
      _ContextualCardsContainerState();
}

class _ContextualCardsContainerState extends State<ContextualCardsContainer> {
  bool loading = true;
  bool error = false;
  List<CardGroup> groups = [];

  @override
  void initState() {
    super.initState();
    _fetchCards();
  }

  Future<void> _fetchCards() async {
    setState(() {
      loading = true;
      error = false;
    });

    try {
      final res = await http.get(Uri.parse(widget.apiUrl));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List<CardGroup> parsed =
            (data['card_groups'] as List?)?.map((e) => CardGroup.fromJson(e)).toList() ?? [];
        groups = await StorageHelper.filterDismissed(parsed);
        setState(() => loading = false);
      } else {
        setState(() {
          loading = false;
          error = true;
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error) {
      return Center(
        child: ElevatedButton(
          onPressed: _fetchCards,
          child: const Text("Retry"),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _fetchCards,
      child: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (ctx, i) {
          return CardGroupWidget(
            group: groups[i],
            onDismiss: (cardId, permanent) {
              setState(() {
                groups = groups
                    .map((g) => g.copyWith(
                    cards: g.cards.where((c) => c.id != cardId).toList()))
                    .toList();
              });
              if (permanent) StorageHelper.dismissForever(cardId);
            },
          );
        },
      ),
    );
  }
}
