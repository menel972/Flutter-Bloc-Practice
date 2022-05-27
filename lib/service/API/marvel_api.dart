// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;
import 'package:crypto/crypto.dart';
import 'package:test_bloc/service/models/character_model.dart';
import 'package:test_bloc/service/models/results_model.dart';

class MarvelApi {
  String md5Generator(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  // = Developper Informations
  final _baseUrl = 'https://gateway.marvel.com:443/v1/public/';
  final _publicKey = '92719875e346944e07cfee80277796e0';
  final _privateKey = '6fa5f408e53f53f3a2bbcf43bbee14ae89bbecd4';
  final String _ts = DateTime.now().toIso8601String();
  String get _hash {
    return md5Generator(_ts + _privateKey + _publicKey);
  }

// = Request Urls
  String _allCharacters(String startWith) {
    return startWith == ''
        ? '${_baseUrl}characters?limit=100&apikey=$_publicKey&hash=$_hash&ts=$_ts'
        : '${_baseUrl}characters?nameStartsWith=$startWith&limit=100&apikey=$_publicKey&hash=$_hash&ts=$_ts';
  }

// {} Requests
  Future<Character> request(String url) async {
    final result = await http.get(Uri.parse(url));
    final body = json.decode(result.body);
    return Character.fromJson(body);
  }

  Future<List<Results>> fetchCharacters(String startWith) async {
    final Character character = await request(_allCharacters(startWith));

    return character.data!.results!;
  }
}
