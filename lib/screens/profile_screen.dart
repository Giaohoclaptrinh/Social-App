import 'package:flutter/material.dart';
import 'package:Project3/lib/models/user_model.dart';
import 'package:Project3/lib/widgets/profile_clipper.dart';
import 'package:Project3/lib/widgets/post_carousel.dart';
class ProfileScreen extends StatefulWidget {

  final User user;
  ProfileScreen({this.user}):


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController = PageController(initialPage: 0, viewporFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0, viewporFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(  
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
              ClipPath(
                clipper: ProfileClipper(),
              child:Image(
                height:300.0,
                width: double.infinity,
                image: AssetImage(widget.user.backgroundImageUrl),
                fit: BoxFit.cover,
              ),//image
              ),//ClipPath
              Positioned(
                top: 50.0, 
                left:20.0,
                child: IconButton(icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Theme.of(context).primaryColor,
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
                ),//IconButton
                ),//Positioned
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                        color: Colors.black45,
                        offSet: OffSet(0,2),
                        blurRadius: 6.0,
                        ),//BoxShadow
                        ],
                      ),//BoxDecoration
                      child: ClipOval(child: Image(
                        height: 120.0, 
                        width: 120.0,
                        image: AssetImage(widget.user.profileImageUrl),
                        fit: BoxFit.cover,
                        ),//Image
                        ),//ClipOval
                  ),//Container
                  ),//Postioned
            ],//Widget
            ),//Stack
            Padding(
              Padding: EdgeInsets.all(15.0),
            child:Text(widget.user.name, style: 
            TextStyle(
              fontSize: 25.0, 
              fontWeight: FontWeight.bold, 
              letterSpacing: 1.5
              ),//TextStyle
              ),//Text
            ),//Padding
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Column(
                  children: <Widget> [
                    Text('Following', 
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22.0,
                      ),//TextStyle
                      ),//Text
                      SizedBox(height: 2.0),
                      Text(
                        widget.user.following.toString(),
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,),
                      ),//Test
                  ],//Widget
                ),//Column
                  Column(
                  children: <Widget> [
                    Text('Followers', 
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 22.0,
                      ),//TextStyle
                      ),//Text
                      SizedBox(height: 2.0),
                      Text(
                        widget.user.followers.toString(),
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,),
                      ),//Test
                  ],//Widget
                ),//Column
              ],//Widget
            ),//Row
            PostsCarousel(
              pageController: 
                _yourPostsPageController, 
                title: 'Your Post',
                posts: widget.user.post,
                ),//PostsCarousel
                PostsCarousel(
              pageController: 
                _favoritesPageController, 
                title: 'Favorites',
                posts: widget.user.favorite,
                ),//PostsCarousel
                SizedBox(height: 50.0),
          ],//Widget
        ),//Column
      ),//SingleChildScrollView
    );//Scaffold
  }
}