import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beers/models/beer_model.dart';

// class BeerService {
//   static Future<List<Beer>> fetchBeers() async {
//     const url = "https://api.punkapi.com/v2/beers";
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonBeers = json.decode(response.body);
//       final List<Beer> beerList =
//           jsonBeers.map((dynamic model) => Beer.fromJson(model)).toList();
//       return beerList;
//     } else {
//       throw Exception("Unable to perform request!");
//     }
//   }
// }

class BeerService {
  static Future<List<Beer>> fetchBeers() async {
    return [
      Beer(
        name: "test",
        imageUrl: "",
        description: "lorem ipsum",
        abv: 10.5,
        ibu: 15.3,
        firstBrewed: "07/2004",
        foodPairing: ["Pasta", "Pizza"],
        brewersTips: "Do this and that, don't do this though.",
      ),
      Beer(
        name: "test 2",
        imageUrl: "",
        description: "lorem ipsum",
        abv: 10.5,
        ibu: 15.3,
        firstBrewed: "07/2004",
        foodPairing: ["Pasta", "Pizza"],
        brewersTips: "Do this and that, don't do this though.",
      )
    ];
  }
}
