import 'dart:io';

import 'package:flutter/material.dart';
import 'package:garbagecl/screens/user_home/tabs/home_tab.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> pages = [
    HomeTab(),
    Container(
      child: Text("Add"),
    ),
    Container(
      child: Text("My Garbage"),
    ),
    Container(
      child: Text("Profile"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Spacer(),
            SizedBox(
              height: 25,
              //width: 150,
              child: Image.asset('assets/images/garbagecl.png'),
            ),
            Spacer(),
            // Text(
            //   'User Home Page',
            //   style: TextStyle(
            //     fontFamily: 'Poppins',
            //     fontWeight: FontWeight.w600,
            //     color: Colors.white,
            //     fontSize: 20,
            //   ),
            // ),
            Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: Container(
        height: Platform.isIOS ? 92 : 70,
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 60, 142, 94),
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "My Garbage",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
              ),
              label: "Profile",
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Poppins',
          ),
          selectedItemColor: Colors.grey,
          unselectedItemColor: Colors.white,
          elevation: 20.0,
          selectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
