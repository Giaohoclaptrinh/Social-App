import 'package:flutter/material.dart';
import 'package:Project3/lib/models/user_model.dart';
import 'package:Project3/lib/data/data.dart';
import 'package:Project3/lib/widgets/post_carousel.dart';
import 'package:Project3/lib/widgets/custom_drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
  with SingleTickerProvideStateMixin {
  TabController _tabController;
  PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction:  0.8);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor,
        ),//IconThemeData
        title: Text('FREMZY',
      style TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 10.0,
            ),//TextStyle
            ),//Text
            bottom: TaskBar(
              controller: _tabController,
              indicatorWeight: 3.0,
              labelColor: Theme.of(context).primaryColor,
              labelStyle: TextStyle(
                fontSize: 18.0, 
                fontWeight: FontWeight.w600,
                ),//TextStyle
                unselectedLabelStyle: TextStyle(
                  fontSize: 18.0
                  ),//TextStyle
              tabs: <Widget> [
              Tab(text: 'Trending',),
              Tab(text: 'Latest'),
            ],//Widget 
            ),//Taskbar
            ),//Appbar
            drawer: CustomDrawer(),
            body: ListView(
              children: <Widget>[
                FollowingUsers(),
                PostsCarousel(
                  pageController:
                   _pageController, 
                   title 'Posts', 
                   posts: posts, 
                   ),//PostsCarousel
              ],//Widget
            ),//ListView
    );//Scaffold
  }
}