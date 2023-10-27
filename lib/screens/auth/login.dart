import 'package:akgsetu/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50.withOpacity(0.9),
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: false, reverse: false),
            child: Container(
              height: height(context) * 0.2,
              color: primaryColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(

                    children: [
                      Image(
                        image: AssetImage('assets/images/akg-logo2.png'),
                        height: height(context) * 0.05,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Icon(Icons.person_outlined, color: Colors.white,),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
