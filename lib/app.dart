import 'package:flashcards/widgets/dictionary_screen.dart';
import 'package:flashcards/widgets/select_deck_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flash Cards',
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings routeSettings) {
    if (routeSettings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return SelectDeckWidget();
        },
      );
    } else if (routeSettings.name == '/dictionary') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return DictionaryScreen();
        },
      );
    }
    else throw Exception('Unknown route ${routeSettings.name}');
  }
}
