import 'package:flutter/material.dart';
import './footb.dart';
import './baskb.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen(this.username, {Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<List<Object>> listing = [
      [
        'assets/football.png',
        FootbScreen("username to be inserted from login")
      ],
      ['assets/baske.png', BaskbScreen()]
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Rivals"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listing.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  child: Image(
                    width: double.infinity,
                    image: AssetImage(listing[index][0] as String),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => listing[index][1] as Widget));
                  },
                ),
              ),
            );
          }),
    );
  }
}


/*

table de photos assets (##  , ## , ## )

list view builder
Image(image:  AssetImage(photos(index)))

*/

