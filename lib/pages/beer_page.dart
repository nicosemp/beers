import 'package:flutter/material.dart';
import 'package:beers/models/beer_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BeerPage extends StatelessWidget {
  final Beer? beer;

  const BeerPage({Key? key, this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beer?.name ?? ""),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "image-birra-" + (beer?.name ?? ""),
                  child: CachedNetworkImage(
                    imageUrl: beer?.imageUrl ?? "",
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const Text("First brewed: "),
                          Text(
                            beer?.firstBrewed ?? "",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                    const Text("Food pairings:"),
                    for (var food in beer?.foodPairing ?? [])
                      Text(
                        "- " + food,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text("Brewer tips:"),
                    ),
                    Text(
                      beer?.brewersTips ?? "",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
