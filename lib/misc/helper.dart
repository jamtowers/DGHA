import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

class Helper {
  Future<String> loadAsset(BuildContext _context, fileName) async {
    var string = await DefaultAssetBundle.of(_context).loadString('assets/$fileName');
    var encoded = utf8.encode(string);
    var decoded = utf8.decode(encoded);
    return decoded; 
  }
}