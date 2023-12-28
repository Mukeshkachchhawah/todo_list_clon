import 'package:flutter/material.dart';
import 'package:task/ui_helper.dart';

class CustomContainerButton extends StatelessWidget {
  double? mHight;
  double? mWidgth;
  String text;
  CustomContainerButton(
      {super.key, this.mHight, this.mWidgth, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.only(left: 20, right: 20),
      height: mHight,
      width: mWidgth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 115, 172, 117)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class CustomGideViewBox extends StatelessWidget {
  // var data = Constants.arrList;
  // double? mHight;
  // double? mWidgth;
  String text;
  String subtext;
  String img;

  VoidCallback ontaped;

  CustomGideViewBox(
      {super.key,
      // this.mHight,
      // this.mWidgth,
      required this.subtext,
      required this.text,
      required this.img,
      required this.ontaped
      
      //  required this.data
      });

  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: ontaped,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color(0xffffffff)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xffe3e6ff)),
                    child: Image.asset(img)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "$text",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                hSpectre(mHeight: 3.0),
                Text(
                  "$subtext",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
