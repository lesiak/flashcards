import 'package:audioplayers/audioplayers.dart';
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
  AudioPlayer audioPlayer = AudioPlayer();

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
                child: Text('Load Data'),
                onPressed: fetchDeck,
              ),
              FlatButton(
                child: Text('Dictionary'),
                onPressed: () => Navigator.pushNamed(context, '/dictionary'),
              ),
              FlatButton(
                child: Text('Test Sound'),
                onPressed: testSound,
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

  void testSound() async {
    var url = 'https://sample-videos.com/audio/mp3/crowd-cheering.mp3';
    int result = await audioPlayer.play(url);
  }
}
