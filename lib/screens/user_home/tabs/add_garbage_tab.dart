import 'package:flutter/material.dart';

class AddGarbageTab extends StatefulWidget {
  const AddGarbageTab({super.key});

  @override
  State<AddGarbageTab> createState() => _AddGarbageTabState();
}

class _AddGarbageTabState extends State<AddGarbageTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 144,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color.fromARGB(204, 247, 233, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
                Text(
                  "SCAN",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        Text(
          "Cannot identify Category? Try Scan.",
          style: TextStyle(
            color: const Color.fromARGB(255, 60, 142, 94),
            fontFamily: 'Poppins',
          ),
        ),
        Spacer(),
        Text(
          "Categories",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 98, 98, 97),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
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
      ],
    );
  }
}
