

import 'dart:convert';
import 'package:asdfg/models/aunction_model.dart';
import 'package:http/http.dart' as http;
class Api {
  static const _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<AuctionModel> fetchAuctionsfromAPI() async {

    final url = await Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    var response = await http.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      print("response is 200");
      // If the call to the server was successful, parse the JSON
      return AuctionModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
