import 'package:flutter/material.dart';
import 'package:task/ui_helper.dart';
import 'package:task/util/colors.dart';
import 'package:task/util/task_color.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff8f8fd),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: greenColors,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(20))),
                  ),

                  /// Sign Out buttom
                  SignOutButton()

                  // hSpecher(mHeight: 5)
                ],
              ),

//// showStackCard
              ShowStackCard(context),

              Positioned(
                  left: 160,
                  top: 110,
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://feeds.abplive.com/onecms/images/uploaded-images/2023/05/28/c525f8d22b834b17906c3fe3ae87b5251685283395918685_original.jpg?impolicy=abp_cdn&imwidth=650"),
                      backgroundColor: const Color.fromARGB(255, 240, 219, 218),
                    ),
                  ))
            ],
          ),
        ));
  }

  Widget TopAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff77e6b6),
            )),
        Text(
          "Profile",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active_sharp,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget ShowStackCard(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //// appbar top
            TopAppBar(context),
            hSpectre(mHeight: 50.0),
            SizedBox(
                height: 200,
                // width: double.infinity,
                child: Card(
                  elevation: 3,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    height: 100,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello, Jhon steward",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Color(0xff0d4d4d)),
                        ),
                        Text(
                          "+91 783164712821",
                          style:
                              TextStyle(color: Color(0xff385a5a), fontSize: 16),
                        ),
                        hSpectre(),
                        Text(
                          "HR Department (Dhaka Office)",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5ed7a3)),
                        )
                      ],
                    ),
                  ),
                )),
            hSpectre(),
            Text(
              "General",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1b5757)),
            ),
            CustomListTile(
                "Language Setup",
                IconButton(
                    onPressed: () {},
                    icon: Switch(
                      value: true,
                      onChanged: (value) {
                        Icon(Icons.lock);
                      },
                    )),
                Icon(
                  Icons.translate,
                  color: Color(0xff43b975),
                )),
            CustomListTile(
                "Change Password",
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_sharp)),
                Icon(
                  Icons.lock,
                  color: Color(0xffc780e1),
                )),
            CustomListTile(
                "Privacy Policy",
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_sharp)),
                Icon(
                  Icons.privacy_tip_outlined,
                  color: Color(0xfff29d51),
                )),
            CustomListTile(
                "Terms and Conditions",
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_sharp)),
                Icon(
                  Icons.file_open_sharp,
                  color: Color(0xffec6262),
                ))
          ],
        ),
      ),
    );
  }

  Widget CustomListTile(String text, IconButton? iconbuttons, Icon ledIcon) {
    return Card(
      child: Container(
        height: 80,
        child: Center(
          child: ListTile(
            leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ProfilebgColor(1)),
                child: ledIcon),
            title: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff2d6464),
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: iconbuttons,
          ),
        ),
      ),
    );
  }

  Widget SignOutButton() {
    return SizedBox(
        width: 350,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff77e6b6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {},
            child: Text(
              "LOG OUT",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff2c806e),
                fontWeight: FontWeight.bold,
              ),
            )));
  }
}
