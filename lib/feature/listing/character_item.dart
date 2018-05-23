import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models.dart';

final _textPadding = 8.0;
final _textSize = 14.0;

class CharacterItem extends StatelessWidget {

  final Character _character;
  final ValueChanged<Character> onTap;

  const CharacterItem(this._character, this.onTap)
      : assert(_character != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTap(_character),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image.network(_character.image, fit: BoxFit.fill,)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Padding(
                      padding: EdgeInsets.all(_textPadding),
                      child: Center(
                        child: Text(
                          _character.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontSize: _textSize),
                          textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}