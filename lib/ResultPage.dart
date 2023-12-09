

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_learning_project/main.dart';

import 'disclaimer.dart';

class ResultPage extends StatefulWidget {
  final String res;

  const ResultPage({Key? key, required this.res}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    String message;
    IconData icon;

    if (widget.res == "covid") {
      backgroundColor = Colors.red;
      message = "COVID Positive";
      icon = Icons.warning; // Choose an appropriate icon
    } else {
      backgroundColor = Colors.green;
      message = "Normal";
      icon = Icons.check_circle; // Choose an appropriate icon
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return Disclaimer();
          }));
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.note_alt_rounded,color: Colors.black,size: 50,),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("How much should you trust us ?",style: GoogleFonts.quicksand(color: Colors.black,fontSize: 15),),
              )
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText(
                        widget.res == "covid" ?
                        ' Isolate Yourself \n\n Notify Close Contacts \n\n Rest and Hydrate \n\n Monitor Your Symptoms \n\n Follow Medical Advice \n\n Avoid Sharing Personal Items' :
                        ' Get Vaccinated and Boosted \n\n Wear Masks in Crowded Places \n\n Handwashing and Hand Sanitizing \n\n Social Distancing \n\n Monitor Your Health \n\n Stay Home if You are Sick',
                        textStyle: GoogleFonts.quicksand(fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
