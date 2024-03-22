import 'package:flutter/material.dart';
import 'package:garbagecl/widgets/custom_button.dart';

class UpdateGarbage extends StatefulWidget {
  const UpdateGarbage({super.key});

  @override
  State<UpdateGarbage> createState() => _UpdateGarbageState();
}

class _UpdateGarbageState extends State<UpdateGarbage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Update',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 98, 98, 97),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Organic",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),

                  SizedBox(width: 10),

                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  Image.asset(
                    'assets/images/minus.png',
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Plastic",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),

                  SizedBox(width: 10),

                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  Image.asset(
                    'assets/images/minus.png',
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Metals",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),

                  SizedBox(width: 10),

                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  Image.asset(
                    'assets/images/minus.png',
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 86,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 232),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  //Spacer(),
                  //Icon(Icons.,size:50,),
                  Image.asset(
                    'assets/images/garbage.png',
                    height: 73,
                  ),
                  SizedBox(width: 35),

                  Text(
                    "Glass",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color.fromARGB(255, 151, 151, 148)),
                  ),
                  Spacer(),
                  SizedBox(
                      height: 20, child: Image.asset('assets/images/plus.png')),

                  SizedBox(width: 10),

                  Text(
                    "1",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(width: 10),

                  Image.asset(
                    'assets/images/minus.png',
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            CustomButton(
              text: "UPDATE",
              height: 50,
              width: screenWidth,
              backgroundColor: Colors.green,
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
