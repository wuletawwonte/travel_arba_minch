import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_arba_minch/widgets/custom_tab_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // PageView Controller
  final _pageController = PageController(viewportFraction: 0.877);

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
                        weight: 2.4,
                      ),
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
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "http://10.144.12.82/img/nechsarnationalpark.jpg",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "http://10.144.12.82/img/arbaminchcrocodileranch.jpg",
                          ),
                        ),
                      ),
                      child: Text("What the heck"),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 28.8),
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/my-first-project-45d43.appspot.com/o/img%2F183094995_5350799221656648_394279319031240409_n.jpg?alt=media&token=6fb2e60e-6416-4b6a-bc1f-c38f1e909d5a"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Smooth page indicator part
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 20),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
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
