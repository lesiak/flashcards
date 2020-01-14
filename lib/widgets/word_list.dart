import 'package:flutter/material.dart';
import '../models/flashcard.dart';

class WordList extends StatelessWidget {
  final List<FlashCard> cards;

  WordList(this.cards);

  @override
  Widget build(BuildContext context) {
    var count = 1;
    return Table(
      //defaultColumnWidth: FixedColumnWidth(150.0),
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 0.4,
        ),
        verticalInside: BorderSide(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 0.4,
        ),
      ),
      children: this.cards.map((c) => _buildTableRow(c)).toList(),
    );
  }

//  TableRow _buildTableRow(String listOfNames) {
//    return TableRow(
//      children: listOfNames.split(',').map((name) {
//        return Container(
//          alignment: Alignment.center,
//          child: Text(name, style: TextStyle(fontSize: 20.0)),
//          padding: EdgeInsets.all(8.0),
//        );
//      }).toList(),
//    );
//  }

  TableRow _buildTableRow(FlashCard card) {
    return TableRow(
      children: [card.en, card.ru, card.ko].map((name) {
        return Container(
          alignment: Alignment.center,
          child: Text(name != null ? name : "",
              style: TextStyle(fontSize: 20.0)),
          padding: EdgeInsets.all(8.0),
        );
      }).toList(),
    );
  }

  Widget buildCard(FlashCard card) {
    return Container(
      child: Column(children: [Text(card.en)]),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    );
  }
}
