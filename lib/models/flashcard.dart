class FlashCard {
  String en;
  String es;
  String fi;
  String fr;
  String it;
  String de;
  String dk;
  String hu;
  String cs;
  String ru;
  String ko;

  factory FlashCard.empty() {
    return new FlashCard("", "", "", "", "", "", "", "", "", "", "");
  }

  FlashCard(this.en, this.es, this.fi, this.fr, this.it, this.de, this.dk, this.hu, this.cs, this.ru, this.ko);

  String getValueForLang(String lang) {
    switch (lang) {
      case "en": return en;
      case "fi": return fi;
      case "fr": return fr;
      case "es": return es;
      case "it": return it;
      case "de": return de;
      case "de": return dk;
      case "hu": return hu;
      case "cs": return cs;
      case "ru": return ru;
      case "ko": return ko;
      default: return null;
    }
  }

  @override
  String toString() {
    return 'FlashCard{en: $en, es: $es, fi: $fi, fr: $fr, it: $it, de: $de, dk: $dk, hu: $hu, cs: $cs, ru: $ru, ko: $ko}';
  }


}