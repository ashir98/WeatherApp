import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_project/controller/global_controller.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = "";
  String area = "";
  String date = DateFormat('yMMMd').format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLatitude.value,
        globalController.getLongtitude.value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    print(place);
    setState(() {
      city = place.locality!;
      area = place.subLocality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          
          alignment: Alignment.topLeft,
          child: Text(
            "$city, $area",
            style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w600),
          ),
        ),

        5.verticalSpace,
        Container(
          
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade600),
          ),
        )
      ],
    );
  }
}
