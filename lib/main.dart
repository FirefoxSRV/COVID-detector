import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ResultPage.dart';
import 'disclaimer.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  XFile? _image;
  bool _isLoading = false;
  bool _modelLoader = false;

  var ip = "192.168.24.139";

  Future<void> _pickImage() async {
    setState(() => _isLoading = true);
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = pickedImage;
        });
      }
    } finally {
      setState(() => _isLoading = false);
      print(_image!.path);
    }
  }



  Future<void> _sendImageToServerSVM(XFile image) async {
    setState(() {
      _modelLoader = true;
    });
    print("Called");
    var uri = Uri.parse('http://$ip:8080/predict/');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        setState(() {
          _image = null;
        });
        var result = jsonDecode(response.body);
        setState(() {
          _modelLoader = false;
        });
        print(result['result']);
        if(result['result'] == "Covid Positive"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res:"covid");
          }));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res: "normal",);
          }));
        }

      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _image = null;
        _isLoading = false;
      });
    }
  }


  Future<void> _sendImageToServerDT(XFile image) async {
    setState(() {
      _modelLoader = true;
    });
    print("Called");
    var uri = Uri.parse('http://$ip:8080/predictDT/');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        setState(() {
          _image = null;
        });
        var result = jsonDecode(response.body);
        setState(() {
          _modelLoader = false;
        });
        print(result['result']);
        if(result['result'] == "Covid Positive"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res:"covid");
          }));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res: "normal",);
          }));
        }

      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _image = null;
        _isLoading = false;
      });
    }
  }

  Future<void> _sendImageToServerRF(XFile image) async {
    setState(() {
      _modelLoader = true;
    });
    print("Called");
    var uri = Uri.parse('http://$ip:8080/predictRF/');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        setState(() {
          _image = null;
        });
        var result = jsonDecode(response.body);
        setState(() {
          _modelLoader = false;
        });
        print(result['result']);
        if(result['result'] == "Covid Positive"){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res:"covid");
          }));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return ResultPage(res: "normal",);
          }));
        }

      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _image = null;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String bTech = '';
    late String greet;
    int dayHour = DateTime.now().hour;
    if (dayHour >= 0 && dayHour < 12) {
      greet = "Good Morning";
    } else if (dayHour >= 12 && dayHour < 17) {
      greet = "Good Afternoon";
    } else if (dayHour >= 17 && dayHour < 24) {
      greet = "Good Evening";
    }

    return LayoutBuilder(builder: (context, constraints) {
      var maxHeight = constraints.maxHeight;
      var maxWidth = constraints.maxWidth;

      Widget imageDisplayWidget;
      if (_image != null) {
        imageDisplayWidget = Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                File(_image!.path),
                width: maxWidth * 0.5,
                height: maxHeight * 0.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (_image != null) {
                        _sendImageToServerSVM(_image!);
                      } else {
                        print('No image selected');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF394b56), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "SVM",
                          style: GoogleFonts.quicksand(color: Color(0xFF394b56), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_image != null) {
                        _sendImageToServerDT(_image!);
                      } else {
                        print('No image selected');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF394b56), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "DT",
                          style: GoogleFonts.quicksand(color: Color(0xFF394b56), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_image != null) {
                        _sendImageToServerRF(_image!);
                      } else {
                        print('No image selected');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF394b56), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "RF",
                          style: GoogleFonts.quicksand(color: Color(0xFF394b56), fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _image = null;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: maxHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xFF394b56),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text("Reselect", style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        imageDisplayWidget = Center(
          child: Text(
            "No image selected",
            style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
          ),
        );
      }

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
        floatingActionButton: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: "Unique1",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return About();
                    }));
                  },
                  backgroundColor: Colors.white,
                  child: Icon(Icons.supervised_user_circle_sharp,color: Color(0xFF394b56),),
                ),
                FloatingActionButton(
                  heroTag: "Unique2",
                  onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Disclaimer();
                      }));
                  },
                  backgroundColor: Colors.white,
                  child: Icon(Icons.info,color: Color(0xFF394b56),),
                ),

              ],
            ),
          ),
        ),
        backgroundColor: Color(0xFF394b56),
        body: _modelLoader?Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ):Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      greet,
                      style: GoogleFonts.quicksand(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: maxHeight * 0.07,
                        decoration: BoxDecoration(
                          color: Color(0xFF394b56),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: _isLoading
                              ? SpinKitFadingCircle(
                                  color: Colors.white,
                                  size: 30,
                                ) // Lazy loader
                              : Text("Upload picture to test", style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.05,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    child: imageDisplayWidget, // This is the animated widget
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}




class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color(0xFF394b56),
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: Color(0xFF394b56),borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          ClipOval(child: Image.asset("assets/images/mithesh.png",scale: 6,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      VerticalDivider(color: Colors.white,thickness: 2),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text("MITESH V",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                          Text("CB.EN.U4CSE21438",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(color: Color(0xFF394b56),borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          ClipOval(child: Image.asset("assets/images/raj.png",scale: 6,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      VerticalDivider(color: Colors.white,thickness: 2),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text("RAJ KUMAR",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                          Text("CB.EN.U4CSE21446",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(color: Color(0xFF394b56),borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          ClipOval(child: Image.asset("assets/images/hare.png",scale: 6,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      VerticalDivider(color: Colors.white,thickness: 2),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text("S HARECHARAN",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                          Text("CB.EN.U4CSE21450",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(color: Color(0xFF394b56),borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          ClipOval(child: Image.asset("assets/images/shreyas.png",scale: 6,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      VerticalDivider(color: Colors.white,thickness: 2),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text("SHREYAS V",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                          Text("CB.EN.U4CSE21455",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(color: Color(0xFF394b56),borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          ClipOval(child: Image.asset("assets/images/siva.png",scale: 6,))
                        ],
                      ),
                      SizedBox(width: 10,),
                      VerticalDivider(color: Colors.white,thickness: 2),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text("SIVA RAJ KUMAR",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                          Text("CB.EN.U4CSE21457",style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

