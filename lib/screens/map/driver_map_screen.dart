import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

class DriverMapScreen extends StatefulWidget {
  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  Completer<GoogleMapController> googleMapCompleterController =
      Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;

  TextEditingController pickupLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController mapController) {
              controllerGoogleMap = mapController;

              // mapProvider.controllerGoogleMap = mapController;

              // mapProvider.googleMapCompleterController
              //     .complete(mapProvider.controllerGoogleMap);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(6.927079, 79.861244),
              zoom: 15,
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height,
            left: 15,
            right: 15,
            child: GooglePlaceAutoCompleteTextField(
              boxDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.blueAccent,
                ),
              ),
              textEditingController: pickupLocationController,
              googleAPIKey: "AIzaSyDcVjuQTxwjA_YQHWSKpjp8DpRryhz-8fs",
              inputDecoration: InputDecoration(
                hintText: "Pickup Location",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              ),
              debounceTime: 800,
              isLatLngRequired: true,
              isCrossBtnShown: true,
            ),
          ),
          Positioned(
            child: Positioned(
              bottom: 1,
              right: 0,
              left: 0,
              child: Container(
                height: screenHeight / 5,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            'Bike',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Image.asset('assets/images/motorcycle.png'),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                'LKR 50',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Per 1 KM',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            'Tuk',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Image.asset('assets/images/tuk.png'),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                'LKR 70',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Per 1 KM',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            'Lorry',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Image.asset('assets/images/lorry.png'),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Text(
                                'LKR 90',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Per 1 KM',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
