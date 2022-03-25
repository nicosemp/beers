import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beers/models/beer_model.dart';

class BeerService {
  static Future<List<Beer>> fetchBeers() async {
    const url = "https://api.punkapi.com/v2/beers";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonBeers = json.decode(response.body);
      final List<Beer> beerList =
          jsonBeers.map((dynamic model) => Beer.fromJson(model)).toList();
      return beerList;
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
