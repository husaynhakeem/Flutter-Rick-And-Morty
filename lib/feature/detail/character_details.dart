import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models.dart';

final _characterInformationPadding = 16.0;
final _characterInformationRightPadding = 20.0;
final _characterInformationKeyValuePadding = 2.0;
final _characterDetailsPadding = 16.0;
final _characterNamePadding = 16.0;
final _characterNameSize = 20.0;

final _nullCharacterMessage = 'No character to display';
final _characterStatus = 'Status';
final _characterSpecies = 'Species';
final _characterType = 'Type';
final _characterGender = 'Gender';
final _characterOrigin = 'Origin';
final _characterLocation = 'Location';

class CharacterDetailsScreen extends StatelessWidget {

  final Character _character;

  const CharacterDetailsScreen(this._character);

  @override
  Widget build(BuildContext context) {
    return _character == null
        ? _buildForNullCharacter()
        : _buildForNonNullCharacter(context);
  }

  Widget _buildForNullCharacter() {
    return Padding(
      padding: EdgeInsets.all(_characterDetailsPadding),
      child: Column(
        children: <Widget>[
          Text(_nullCharacterMessage, style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: _characterNameSize),),
        ],
      ),
    );
  }

  Widget _buildForNonNullCharacter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _characterDetailsPadding),
      child: ListView(
        children: <Widget>[
          Image.network(_character.image),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: _characterNamePadding),
              child: Text(_character.name, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: _characterNameSize),),
            ),
          ),
          _buildInformationWidget(
              Icons.all_inclusive, _characterStatus, _character.status),
          _buildInformationWidget(
              Icons.pets, _characterSpecies, _character.species),
          _buildInformationWidget(
              Icons.person, _characterType, _character.type),
          _buildInformationWidget(
              Icons.wc, _characterGender, _character.gender),
          _buildInformationWidget(
              Icons.public, _characterOrigin, _character.origin.name),
          _buildInformationWidget(
              Icons.place, _characterLocation, _character.location.name),
        ],
      ),
    );
  }

  Widget _buildInformationWidget(IconData icon, String key, String value) {
    return Row(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(
              top: _characterInformationPadding,
              bottom: _characterInformationPadding,
              right: _characterInformationRightPadding,
              left: _characterInformationPadding),
          child: Icon(icon, color: Colors.grey[600],),
        ),
        _buildKeyValueWidget(key, value),
      ],
    );
  }

  Widget _buildKeyValueWidget(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.only(
              bottom: _characterInformationKeyValuePadding),
          child: Text(key, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        Text(value),
      ],
    );
  }
}