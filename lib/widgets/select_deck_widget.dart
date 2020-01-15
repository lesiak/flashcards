import 'package:flashcards/service/deck_loader.dart';
import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import 'word_list.dart';

class SelectDeckWidget extends StatefulWidget {
  @override
  State createState() => SelectDeckWidgetState();
}

class SelectDeckWidgetState extends State<SelectDeckWidget> {
  int counter = 0;
  List<FlashCard> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flash Cards")),
        body: buildBody(),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: fetchDeck));
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        WordList(flashcards),
        Container(

          child: ButtonBar(

            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Dictionary'),
              ),
              FlatButton(
                child: Text('Dictionary'),
              )
            ],
          ),
        )
      ],
    );
//
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
