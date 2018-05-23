import 'package:flutter/material.dart';

import 'package:rick_and_morty/feature/listing/characters_screen.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rick & Morty'),
        ),
        body: CharactersScreen(),
      ),
    );
  }
}