import 'package:flutter/material.dart';
import 'package:Project3/lib/models/post_model.dart';

class PostsCarousel extends StatelessWidget {

  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel({this.pageController, this.title, this.posts});

  _buildPost(BuildContext context, int index) {
    Post post = posts[index];
    return  AnimatedBuilder( 
      animation: pageController, 
      builder: (BuildContext context, Widget widget) {
        double value =1;
        if(pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1-(value.abs() * 0.25)).clamp(0.0 , 1.0);
        }
        return Center(child: SizedBox(
          height: Curves.easeInOut.transform(value) *400.0,
          child: widget,
          ),//SizedBox
          );//Center
      },
    child:Stack(children: <Widget>[
      Container(margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [BoxShadow(
          color: Colors.black26, 
          offset: Offset(0, 2),
        blurRadius: 6.0,
        ),//boxshadow
        ],
      ),//BoxDecoration 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image(
          height: 400.0, 
          width: 300.0,
          image: AssetImage(post.imageUrl),
          fit: BoxFit.cover,
        ),//image
      ),//clipRRect
      ), //Container
      Positioned(
        left:10.0,
        bottom: 10.0,
        right: 10.0,
      child:Container(
        padding:EdgeInsets.all(12.0),
        height: 110.0,
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
        ),//Borderradius.only
        ),//BoxDecoration
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start
          children:<Widget>[
            Text(post.title, 
            style: TextStyle(
              fontSize: 24.0, 
              fontWeight: FontWeight.bold, 
              ),//TextStyle
              overflow: TextOverflow.ellipsis,
              ),//Text
            Text(post.location, 
            style: TextStyle(
              fontSize: 18.0, 
              fontWeight: FontWeight.w600, 
              ),//TextStyle
               overflow: TextOverflow.ellipsis,
              ),//Text
              SizedBox(height: 6.0), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.favourite, color: Colors.red,
                ),//Icon
                SizedBox(width: 6.0),
                Text(post.like.toString(), style: TextStyle( fontSize:18.0, ),),
              ],//Widget
              ),//Row
               Row(children: <Widget>[
                Icon(Icons.comment, color: Theme.of(context).primaryColor,
                ),//Icon
                SizedBox(width: 6.0),
                Text(post.comments.toString(),  style: TextStyle( fontSize:18.0, ),),
              ],//Widget
              ),   
            ],//widget
            ),//row
          ],//Widget
          ),//Column
      ),//Container
      ),//Positioned
    ],//widget
    ),//stack
    );//AnimatedBuilder
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
                      padding: EdgeInsets.fromLTRB(20.0 , 20.0 ,20.0, 10.0),
                  child:Text(
                  title, 
                  style: TextStyle(
                    fontSize: 24.0, 
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 2.0,
                  ),//TextStyle
                  ),//Text
                    ),//Padding
            Container(
              height: 400.0,
              child: PageView.builder(
                controller: pageController,
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                 return  _buildPost(context, index);                 
                },
              ),//pageview.builder
              ),//Container
      ],//widget
    );//column
  }
}