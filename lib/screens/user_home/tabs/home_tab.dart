import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: screenWidth / 2 - 50,
              width: screenWidth / 2 - 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 233, 255),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Spacer(),
                  SizedBox(
                    height: 35,
                    //width: 150,
                    child: Image.asset('assets/images/coin.png'),
                  ),
                  Text(
                    '358',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Points',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: screenWidth / 2 - 50,
              width: screenWidth / 2 - 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 240, 207),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Spacer(),
                  SizedBox(
                    height: 35,
                    //width: 150,
                    child: Image.asset('assets/images/shipped.png'),
                  ),
                  Text(
                    '23',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Pickups',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Recent Activities',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
