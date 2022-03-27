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
                    _sectionTitle(context, title: "First brewed"),
                    _sectionContent(
                      children: [
                        Text(
                          beer?.firstBrewed ?? "",
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      ],
                    ),
                    _sectionTitle(context, title: "Food pairings"),
                    _sectionContent(
                      children: [
                        for (var food in beer?.foodPairing ?? [])
                          Text(
                            "- " + food,
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                      ],
                    ),
                    _sectionTitle(context, title: "Brewer tips"),
                    _sectionContent(
                      children: [
                        Text(
                          beer?.brewersTips ?? "",
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      ],
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

  Widget _sectionTitle(BuildContext context, {String title = ""}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          )),
    );
  }

  Container _sectionContent({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.deepOrange,
            width: 3.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
