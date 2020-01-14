import 'dart:collection';

class FlashCard {
  String word;
  String answer;
  GrammarNotes grammar;

  factory FlashCard.empty() {
    return new FlashCard("", "", LinkedHashMap(), LinkedHashMap());
  }

  FlashCard(
      this.word,
      this.answer,
      LinkedHashMap<String, String> declensionSingular,
      LinkedHashMap<String, String> declensionPlural) {
    this.grammar = GrammarNotes(declensionSingular, declensionPlural);
  }

  @override
  String toString() {
    return 'FlashCard{word: $word, answer: $answer}';
  }

}

class GrammarNotes {
  LinkedHashMap<String, String> declensionSingular;
  LinkedHashMap<String, String> declensionPlural;

  GrammarNotes(this.declensionSingular, this.declensionPlural);
}