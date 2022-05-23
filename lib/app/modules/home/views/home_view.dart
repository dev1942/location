import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:http/http.dart' as http;

class HomeView extends GetView<HomeController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  postData() async {
    try {
      print('This Is Working');
      var response = await http.post(
          Uri.parse(
              'http://3.0.19.152:8080/api/v1/EnN9Hfegyeh97uHQeqoM/telemetry'),
          body: {
            'lat': "${controller.latitude.value}",
            'long': "${controller.longitude.value}"
          });
      print(response.body);
    } catch (e) {
      // _scaffoldKey.currentState.show
      print(e);
      print('something horrible wrong happened');
      // var snackbar = SnackBar(
      //   content: Text(e.toString()),
      //   duration: Duration(milliseconds: 300),
      // );
      // GlobalKey<ScaffoldState>().currentState.ScaffoldMessenger.showSnackBar(snackbar);

      // GlobalKey<ScaffoldState>().showSnackBar( SnackBar( content: Text("Incremented"), duration: Duration(milliseconds: 300), ), );
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter somethong here to display on snackbar")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 220, 64),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: Color.fromARGB(255, 14, 12, 1),
                size: 40,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'User Location',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    decoration: TextDecoration.underline),
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => Text(
                  controller.latitude.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Obx(
                () => Text(
                  controller.longitude.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Obx(
                () => Text(
                  controller.address.value,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                //style: ButtonStyle(backgroundColor: Color.fromARGB(255, 21, 98, 160),),
                onPressed: postData,
                child: Text(
                  'Post Your Location to our hackers',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
