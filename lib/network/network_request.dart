import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_learn_riverpod/model/photo_response.dart';

List<GetPhotosResponse> parsePhotos(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<GetPhotosResponse> photos =
      list.map((model) => GetPhotosResponse.fromJson(model)).toList();
  return photos;
}

Future<List<GetPhotosResponse>> fetchPhotos() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (response.statusCode == 200) {
    return compute(parsePhotos, response.body);
  } else {
    throw Exception("Failed to get body");
  }
}
