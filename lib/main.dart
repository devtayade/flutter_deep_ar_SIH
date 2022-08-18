import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';

const apikey =
    "5f6d755b8fecc8901d48478b6f68152d674978a1f2ba85a3df87c357f70b9d61d7175274e3275b70";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectCount = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          CameraDeepAr(
              onCameraReady: (isReady) {
                setState(() {});
              },
              onImageCaptured: (path) {
                setState(() {});
              },
              onVideoRecorded: (path) {
                setState(() {});
              },
              androidLicenceKey: apikey,
              iosLicenceKey: apikey,
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              }),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      child: Icon(Icons.navigate_next),
                      onPressed: () => {
                            cameraDeepArController.changeMask(effectCount),
                            if (effectCount == 7) {effectCount = 0},
                            effectCount++
                          })))
        ],
      )),
    );
  }
}
