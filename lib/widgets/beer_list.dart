import 'package:flutter/material.dart';
import 'package:beers/models/beer_model.dart';
import 'package:beers/pages/beer_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BeerList extends StatefulWidget {
  final List<Beer>? beerList;

  const BeerList({Key? key, this.beerList}) : super(key: key);

  @override
  State<BeerList> createState() => _BeerListState();
}

class _BeerListState extends State<BeerList> {
  final TextEditingController _searchTextController = TextEditingController();
  List<Beer> _filteredBeerList = [];

  @override
  void initState() {
    super.initState();
    _filteredBeerList = (widget.beerList as List<Beer>);

    _searchTextController.addListener(() {
      String filter = _searchTextController.text;
      setState(() {
        _filteredBeerList = (widget.beerList as List<Beer>).where((beer) {
          return (beer.name?.toLowerCase().contains(filter) ?? false) ||
              (beer.description?.toLowerCase().contains(filter) ?? false);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchTextController,
              decoration: const InputDecoration(
                labelText: "Filter...",
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredBeerList.length,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return InkWell(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                              tag: "image-birra-" +
                                  (_filteredBeerList[index].name ?? ""),
                              child: CachedNetworkImage(
                                imageUrl:
                                    _filteredBeerList[index].imageUrl ?? "",
                                placeholder: (context, url) => const Center(
                                  child: SizedBox(
                                    height: 40.0,
                                    width: 40.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _filteredBeerList[index].name ?? "",
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    _filteredBeerList[index].description ?? "",
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text("ABV: "),
                                    Text(
                                      (_filteredBeerList[index].abv ?? "N/A")
                                              .toString() +
                                          "%",
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("IBU: "),
                                    Text(
                                      (_filteredBeerList[index].ibu ?? "N/A")
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BeerPage(
                            beer: _filteredBeerList[index],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
