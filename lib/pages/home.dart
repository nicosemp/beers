import 'package:flutter/material.dart';
import 'package:beers/widgets/beer_list.dart';
import 'package:beers/models/beer_model.dart';
import 'package:beers/services/beer_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Beer>> futureBeerList;

  @override
  void initState() {
    futureBeerList = BeerService.fetchBeers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child:
                    SizedBox(height: 50, child: Image.asset("images/logo.png")),
              ),
              Text(widget.title),
            ],
          ),
        ),
        body: FutureBuilder(
          future: futureBeerList,
          builder: (BuildContext context, AsyncSnapshot<List<Beer>> snapshot) {
            if (snapshot.hasData) {
              return BeerList(
                beerList: snapshot.data,
              );
            } else {
              return Center(
                child: Image.asset("images/logo.png"),
              );
            }
          },
        ),
      ),
    );
  }
}
