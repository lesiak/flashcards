import 'dart:convert' as convert;

import 'package:flashcards/model/card.dart';
import 'package:http/http.dart' as http;


class DeckLoader {

  static Future<List<Card>> loadWords() async {
    var url = 'https://raw.githubusercontent.com/lesiak/DartFlashCards/master/flashcardsnew/web/wordfiles/Level1/01_NatureBeginner.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return _buildDeckFromJson(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//  static Future<List<Card>> loadDeckFile(String wordFilePath) {
//    Future<List<Card>> allCardsFut = HttpRequest.getString(wordFilePath).then(_buildDeckFromJson);
//    return allCardsFut;
//  }

  static List<Card> _buildDeckFromJson(String wordListJSON) {
    List rawData = convert.jsonDecode(wordListJSON); // parse response text
    List<Card> allCards = rawData.map(_entryToCard).toList();
    return allCards;
  }

  static Card _entryToCard(var entry) {
    return new Card(
        entry["en"],
        entry["es"],
        entry["fi"],
        entry["fr"],
        entry["it"],
        entry["de"],
        entry["dk"],
        entry["hu"],
        entry["cs"],
        entry["ru"],
        entry["ko"]);
  }

}