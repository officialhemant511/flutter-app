import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/D4D03AQHIFEbxuctuMA/profile-displayphoto-shrink_100_100/0/1672316607533?e=1680134400&v=beta&t=1X58Q0UAqwf5yDTqD_J8z1hLgJ9yWVFHvcaCW9tR6zc";
    return Drawer(
      // backgroundColor: Colors.blue,
      width: 278.0,
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                // margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    // decoration: BoxDecoration(
                    //     // color: Colors.white,
                    //     ),
                    margin: EdgeInsets.zero,
                    accountName: Text(
                      "Hemant Bhatt",
                      // style: TextStyle(
                      //     color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text("officialhemant511@gmail.com "),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ))),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
