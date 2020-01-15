import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class WordList extends StatelessWidget {
  final List<FlashCard> cards;

  WordList(this.cards);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black,
              height: 1,
              thickness: 0.4,
            ),
        itemCount: cards.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(cards[index], index);
        });
  }

  Widget buildCard(FlashCard card, int index) {
    return Container(
      child: Column(
        children: [
          Text(
            card.word,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(card.answer, style: TextStyle(fontFamily: 'Roboto'))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      padding: EdgeInsets.all(5.0),
    );
  }
}
