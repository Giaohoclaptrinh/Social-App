import 'package:flutter/material.dart';
import 'package:Project3/lib/widgets/curve_clipper.dart';
import 'package:Project3/lib/screens/home_screen.dart';
class LoginScreen extends StatefulWidget {  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        child: Container(,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            ClipPath(
              clipper: CurveClipper(),
            child: Image(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              image: AssetImage('assests/images/login_background.jpg'),
              fit: BoxFit.cover,
            ),//image
            ),//ClipPath
            Text('FRENZY', 
            style: TextStyle(color: Theme.of(context).primaryColor,
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
            ),//TextStyle
            ),//Text
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
            child:TextField(decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Username',
              prefixIcon: Icon(
                Icons.account_box, 
                size: 30.0,
                ),//Icon
            ),//Inputdecoration
            ),//Textfield
            ),//padding
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
            child:TextField(decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock, 
                size: 30.0,
                ),//Icon
            ),//Inputdecoration
            obscureText: true,
            ),//Textfield
            ),//padding
            SizedBox(height:40.0),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (_) =>HomeScreen(),
                  ),//MaterialPAgeROute
                  ),//Navigator
            Container(margin: EdgeInsets.symmetric(horizontal: 60.0),
            alignment: Alignment.center, 
            height: 45.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),//BoxDecoration
            child: Text('Login', 
            style: TextStyle(
              color: Colors.white, 
              fontSize: 22.0, 
              fontWeight: FontWeight.w600, 
              letterSpacing: 1.5,
              ),//TextStyle
              ),//Text
            ),//Container
            ),//GestureDetector
            Expanded(
            child:Align(
              alignment: FractionalOffset.bottomCenter,
            child:GestureDetector(
              onTap: () {}, 
            child:Container(
              alignment: Alignment.center, 
              color: Theme.of(context).primaryColor,
              height:80.0,
              child: Text('Don\'t have an account? Sign up', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 20.0, 
                fontWeight: FontWeight.w500, 
              ),//textStyle
              ),//Text
            ),//Container
            ),//GestureDetector
            ),//Align
            ),//Expanded
          ],//Widget
          ),//Column
          ),//Container
      ),//SingleChildScrollView
    );//Scaffold
  }
}