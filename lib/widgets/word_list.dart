import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class WordList extends StatelessWidget {
  final List<FlashCard> cards;

  WordList(this.cards);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(cards[index]);
        });
  }

  Widget buildCard(FlashCard card) {
    return Container(
      child: Column(
          children: [
            Text(card.en)
          ]
      ),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    );
  }
}
