import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_arba_minch/widgets/custom_tab_indicator.dart';

import 'models/destination.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageView Controller
  final _pageController = PageController(viewportFraction: 0.877);
  List<Destination> destinations = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<Destination>> _getDestinations() async {
    try {
      final response = await http
          .get(Uri.parse('http://10.144.12.82/public/rest/destinations'));
      if (response.statusCode == 200) {
        Iterable result = json.decode(response.body);
        setState(() {
          destinations = result.map((m) => Destination.fromJSON(m)).toList();
        });
        return destinations;
      } else {
        throw "Unable to fetch Destinations";
      }
    } on SocketException {
      throw "No Internet Connection";
    } on HttpException {
      throw "Unable to fetch Destinations";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              // Drawer button and search button row
              Container(
                height: 57.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      padding: EdgeInsets.all(13),
                      child: Icon(Icons.sort_rounded, color: Colors.black45),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      padding: EdgeInsets.all(13),
                      child: Icon(Icons.search, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              // Explore Arba Minch Text
              Padding(
                padding: EdgeInsets.only(top: 25, left: 28.8),
                child: Text(
                  'Explore\nArba Minch',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // Tabs of the app
              Container(
                  height: 30,
                  margin: EdgeInsets.only(left: 14.4, top: 28.8),
                  child: DefaultTabController(
                    length: 4,
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 14.4),
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 14.4),
                      isScrollable: true,
                      labelColor: Color(0xFF000000),
                      unselectedLabelColor: Color(0xFF8a8a8a),
                      labelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                      indicator: RoundedRectangleTabIndicator(
                          color: Theme.of(context).primaryColor,
                          width: 15,
                          weight: 2.4),
                      tabs: [
                        Tab(
                          child: Container(
                            child: Text('Recommended'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Popular'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('New Destination'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Text('Hidden Gems'),
                          ),
                        ),
                      ],
                    ),
                  )),
              // Pageview for the destinations
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 16),
                child: FutureBuilder(
                    future: _getDestinations(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return PageView.builder(
                          physics: BouncingScrollPhysics(),
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 28.8),
                              width: 300,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    snapshot.data[index].imageurl,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        String error = snapshot.error.toString();
                        return Center(child: Text(error));
                      }
                    }),
              ),
              // Smooth page indicator part
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 20),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: destinations.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).primaryColor,
                    dotHeight: 9,
                    dotWidth: 9,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
