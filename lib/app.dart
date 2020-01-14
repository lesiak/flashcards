import 'package:flashcards/service/deck_loader.dart';
import 'package:flutter/material.dart';
import 'models/flashcard.dart';
import 'widgets/word_list.dart';

class App extends StatefulWidget {
  @override
  State createState() => AppState();
}

class AppState extends State<App> {

  int counter = 0;
  List<FlashCard> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Let's see some images!")),
            body: WordList(flashcards),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: fetchDeck
            )
        )
    );
  }

  void fetchDeck() async {
    ++counter;
//    var url = "https://jsonplaceholder.typicode.com/photos/$counter";
//    print("Loading $url");
//    var response = await get(url);
//    print(response.statusCode);
//    print(response.body);
//    var imageModel = ImageModel.fromJson(json.decode(response.body));
//    setState(() => images.add(imageModel));
    var cards = await DeckLoader.loadWords();
    setState(() => this.flashcards = cards);
  }
}