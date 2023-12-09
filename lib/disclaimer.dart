import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Disclaimer extends StatefulWidget {
  const Disclaimer({Key? key}) : super(key: key);

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2dfd1),
      body: LayoutBuilder(builder: (context, constraints) {
        late double containerHeight = constraints.maxHeight;
        late double containerWidth = constraints.maxWidth;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Color(0xFFf2dfd1),
                bottom: PreferredSize(
                    preferredSize: const Size(0, 40),
                    child: Text(
                      "Disclaimer ",
                      style: GoogleFonts.quicksand(fontSize: 40.0, fontWeight: FontWeight.w500),
                    ))),
            SliverToBoxAdapter(
              child: SizedBox(
                height: containerHeight / 28.6,
              ),
            ),
            const SliverToBoxAdapter(
                child: Divider(
              endIndent: 10,
              indent: 10,
              color: Colors.grey,
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: containerHeight / 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                child: Text(
                  "While our models are developed with precision and have demonstrated high accuracy in classification tasks, they are not infallible. Users are advised that:",
                  style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.no_accounts,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Not 100% Reliable",
                          style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.auto_graph_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Continuous Improvement",
                          style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.health_and_safety,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Always Consult Healthcare\n Professionals",
                          style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Icon(
                          Icons.monitor_heart,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Not a Substitute for \n Professional Medical Advice",
                          style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(indent: 40,endIndent: 50,thickness: 2,),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Text("Performance",style:GoogleFonts.quicksand(fontSize: 30.0, fontWeight: FontWeight.w700)),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "CNN",
                        style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "95.9 %",
                        style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "SVM",
                        style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "95.8 %",
                        style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Text(
                        "RF   ",
                        style: GoogleFonts.quicksand(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "97.8 %",
                        style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Divider(indent: 40,endIndent: 50,thickness: 2,),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Text("Observations",style:GoogleFonts.quicksand(fontSize: 30.0, fontWeight: FontWeight.w700)),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Text(
                      "We have some visuals to display in order to prove that this is just a working model and should not be used for scale. ",
                      style: GoogleFonts.quicksand(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Text(
                      "Feature importance",
                      style: GoogleFonts.quicksand(color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Image.asset("assets/images/feature_importance.jpg")
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Text(
                      "Heat map for SVM",
                      style: GoogleFonts.quicksand(color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Image.asset("assets/images/svm.jpg")
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Text(
                      "Heat map for DT",
                      style: GoogleFonts.quicksand(color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Image.asset("assets/images/DT.jpg")
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
                    child: Text(
                      "Heat map for RF",
                      style: GoogleFonts.quicksand(color: Colors.black, fontSize: 23,fontWeight: FontWeight.w500),
                    ),
                  ),
                  Image.asset("assets/images/RF.jpg")
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
