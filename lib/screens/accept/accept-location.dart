import 'package:akgsetu/common/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../common/utils/utility.dart';
import '../../constants.dart';
import '../common/navToProfile.dart';
import '../profile/profile.dart';
import '../routes/app_pages.dart';

class AcceptLocation extends StatefulWidget {
  const AcceptLocation({super.key});

  @override
  State<AcceptLocation> createState() => _AcceptLocationState();
}

class _AcceptLocationState extends State<AcceptLocation> {
  GoogleMapController? _mapController;
  List<Marker> markers = [];
  List<Polyline> polylines = [];

  @override
  void initState() {
    super.initState();
    // Initialize the markers and polyline
    _addMarkers();
    _addPolyline();
  }

  void _addMarkers() {
    // Add markers for the two coordinates
    markers.add(
      Marker(
        markerId: MarkerId('Marker1'),
        position:
            LatLng(37.7749, -122.4194), // Replace with your first coordinate
        infoWindow: InfoWindow(title: 'Marker 1'),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId('Marker2'),
        position:
            LatLng(37.7749, -122.2111), // Replace with your second coordinate
        infoWindow: InfoWindow(title: 'Marker 2'),
      ),
    );
  }

  void _addPolyline() {
    // Create a polyline between the two coordinates
    polylines.add(
      Polyline(
        polylineId: PolylineId('Polyline'),
        color: Colors.blue,
        points: [
          LatLng(37.7749, -122.4194), // Replace with your first coordinate
          LatLng(37.7749, -122.2111), // Replace with your second coordinate
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = Utils.getScreenWidth(context);
    var height = Utils.getScreenHeight(context);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: [
              ClipPath(
                clipper: WaveClipperTwo(flip: false, reverse: false),
                child: Container(
                  height: height / 6,
                  color: primaryColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          10.width,
                          Text(
                            "Location",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Spacer(),
                          NavToProfile(),
                        ],
                      )),
                ),
              ),
              Utils.addGap(10),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    Text(
                      "Ticket No - #03s5468",
                      style: TextStyle(fontSize: 19, color: Colors.black87),
                    ),
                    Spacer(),
                    Text("22-05-2023"),
                  ],
                ),
              ),
              Utils.addGap(5),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "102, Shivam Complex,Nana Bazaar,Vallabh Vidyanagar,Anand,Gujarat 388120",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Utils.addGap(12),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "25 min away form your current location",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
              Utils.addGap(15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: height / 3, width: width, decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 3),), child: 
              GoogleMap(
                zoomControlsEnabled: false,
                onMapCreated: (controller) {
                  setState(() {
                    _mapController = controller;
                  });
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749,
                      -122.4194),
                  zoom: 10.0, 
                ),
                markers: Set.from(markers),
                polylines: Set.from(polylines),
              ),),

                 Padding(
                  padding:  EdgeInsets.only(top:40.0.sp),
                  child: AcceptButton(
                    buttonText: 'Checkin',
                    width: width/1.7,
                    onpressed: () {
                      Get.toNamed(Routes.inventoryConsumed);
                    },
                  ),
                )

            ],),);
  }
}
