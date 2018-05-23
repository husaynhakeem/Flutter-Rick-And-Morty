import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/characters_api.dart';
import 'package:rick_and_morty/data/models.dart';
import 'package:rick_and_morty/feature/detail/character_details.dart';
import 'backdrop.dart';

import 'character_item.dart';

final _charactersGridViewMargin = 4.0;
final _charactersGridViewSpanCountPortrait = 2;
final _charactersGridViewSpanCountLandscape = 4;

final _frontTitle = 'Character';
final _backTitle = 'Rick & Morty';

class CharactersScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => CharactersState();
}

class CharactersState extends State<CharactersScreen> {

  final _characters = <Character>[];
  Character _currentCharacter;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_characters.isEmpty) {
      await _loadCharacters();
    }
  }

  Future _loadCharacters() async {
    final api = Api();
    final characters = await api.getCharacters();
    setState(() {
      _characters.addAll(characters);
    });
  }

  void _onCharacterTapped(Character character) {
    setState(() {
      _currentCharacter = character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontTitle: Text(_frontTitle),
      backTitle: Text(_backTitle),
      currentCharacter: _currentCharacter,
      backPanel: _buildBackPanel(),
      frontPanel: _buildFrontPanel(),);
  }

  Widget _buildFrontPanel() {
    return CharacterDetailsScreen(_currentCharacter);
  }

  Widget _buildBackPanel() {
    if (_characters.isEmpty) {
      return _buildForLoadingState();
    } else {
      return _buildForLoadedState();
    }
  }

  Widget _buildForLoadingState() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildForLoadedState() {
    return Padding(
      padding: EdgeInsets.all(_charactersGridViewMargin),
      child: GridView.count(
        crossAxisCount: _getCharactersGridViewSpanCount(),
        children: _characters.map((character) =>
            CharacterItem(character, _onCharacterTapped)).toList(),
      ),
    );
  }

  int _getCharactersGridViewSpanCount() {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait)
      return _charactersGridViewSpanCountPortrait;
    return _charactersGridViewSpanCountLandscape;
  }
}