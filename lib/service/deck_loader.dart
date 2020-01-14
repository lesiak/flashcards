import 'dart:collection';
import 'package:yaml/yaml.dart';

import 'package:flashcards/models/flashcard.dart';
import 'package:http/http.dart' as http;


class DeckLoader {

  static Future<List<FlashCard>> loadWords() async {
    var repoBase = 'https://raw.githubusercontent.com/lesiak/flashcards-data/master';
    var url = '$repoBase/ru/01_NatureBeginner.yaml';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return _buildDeckFromYaml(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

//  static Future<List<Card>> loadDeckFile(String wordFilePath) {
//    Future<List<Card>> allCardsFut = HttpRequest.getString(wordFilePath).then(_buildDeckFromJson);
//    return allCardsFut;
//  }

  static List<FlashCard> _buildDeckFromYaml(String wordListYaml) {
    List rawData = loadYaml(wordListYaml); // parse response text
    List<FlashCard> allCards = rawData.map(_entryToCard).toList();
    return allCards;
  }

  static FlashCard _entryToCard(var entry) {
    return new FlashCard(
        entry["word"],
        entry["answer"],
        entry["declensionSingular"] != null ?
          LinkedHashMap<String,String>.from(entry["declensionSingular"]):
          null,
        entry["declensionPlural"]);
  }

}