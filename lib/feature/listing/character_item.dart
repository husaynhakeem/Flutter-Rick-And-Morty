import 'package:flutter/material.dart';

final _textPadding = 8.0;
final _textSize = 14.0;

class CharacterItem extends StatelessWidget {

  final String _image;
  final String _name;

  const CharacterItem(this._name, this._image)
      : assert(_name != null),
        assert(_image != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: Image.network(_image, fit: BoxFit.fill,)),
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
                        _name,
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
    );
  }
}