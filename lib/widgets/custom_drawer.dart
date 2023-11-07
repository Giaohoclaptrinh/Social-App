import 'package:flutter/material.dart';
import 'package:Project3/lib/screens/home_screen.dart';
import 'package:Project3/lib/screens/login_screen.dart';
import 'package:Project3/lib/screens/profile_screen.dart';
class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon, 
      title: Text(
        title, 
        style: TextStyle
        (fontSize:20.0,
        ),//TextStyle
        ),//Text
        onTap: onTap,
        ),//ListTile
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget[
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl
                ),//AssetImage
                fit:BoxFit.cover,
              ),//Image
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  Container(
                    height: 100.0,
                    width:100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, 
                      border: Border.all(
                        width: 3.0, 
                        color: Theme.of(context).primaryColor,
                      ),//Border.all
                      ),//Boxdecoration
                      child: ClipOval(child: Image(image: AssetImage(
                        currentUser.profileImageUrl,
                        ),//AssetImage
                      fit: BoxFit.cover,
                      ),//Image
                      ),//ClipOval
                  ),//Container
                  SizedBox(width: 6.0),
                  Text(currentUser.name, 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),//TextStyle
                  ),//Text
                ],//Widget
                ),//Row
                ),//Positoned
        ],//widget
        ),//Stack
      _buildDrawerOption(
        Icon(Icons.dashboard), 
        'Home', 
        ()=>Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => HomeScreen(),
        ),//MaterialPageROute
        ),
        ),
        _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
        _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
        _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', ()=>Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser,
        ),
        ),//MaterialPageROute
        ),), 
        _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
        Expaned(child: Align(alignment: FractionalOffset.bottomCenter,
        child:  _buildDrawerOption(Icon(Icons.direction_run), 'Logout',()=>Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => LoginScreen(),
        ),//MaterialPageROute
        ),
        ),  
        ),//Align
        ),//Expanded
       
      ],//Widget
      ),//Column
    );//Drawer
  }
}