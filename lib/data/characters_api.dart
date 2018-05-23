import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'models.dart';

class Api {

  final String _baseUrl = 'rickandmortyapi.com';
  final String _charactersUrl = '/api/character';
  final String _charactersJsonKey = 'results';

  final HttpClient _httpClient = HttpClient();

  Future<List<Character>> getCharacters() async {
    final uri = Uri.https(_baseUrl, _charactersUrl);
    final response = await _getJson(uri);

    if (response == null || response[_charactersJsonKey] == null) {
      print('Api.getCharacters(): Error while retrieving characters');
      return null;
    }

    return _convert(response[_charactersJsonKey]);
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode != HttpStatus.OK) {
        print('Api._getJson($uri) status code is ${response.statusCode}');
        return null;
      }

      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('Api._getJson($uri) exception thrown: $e');
      return null;
    }
  }

  List<Character> _convert(List charactersJson) {
    List<Character> characters = <Character>[];

    charactersJson.forEach((character) {
      characters.add(Character.fromJson(character));
    });

    return characters;
  }
}