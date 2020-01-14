class FlashCard {
  String word;
  String answer;

  factory FlashCard.empty() {
    return new FlashCard("", "");
  }

  FlashCard(this.word, this.answer);

  @override
  String toString() {
    return 'FlashCard{word: $word, answer: $answer}';
  }

}