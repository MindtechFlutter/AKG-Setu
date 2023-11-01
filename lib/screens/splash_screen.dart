import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import '../common/routes/app_pages.dart';
import '../common/utils/dimensions.dart';
import '../common/utils/image_paths.dart';
import '../constants.dart';
import 'auth/login.dart';

/*class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  final SplashController _splashController =
      Get.put(SplashController());
  late FlutterGifController controller1;

  @override
  void initState() {

    controller1 = FlutterGifController(vsync: this);

*/ /*
    _splashController.getTokenApi(context);
*/ /*

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
        min: 5,
        max: 15,
        period: const Duration(milliseconds: 1000),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.screenWidth = MediaQuery.of(context).size.width;
    Dimensions.screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppIcons.splashLogoPng),fit: BoxFit.fill,),
          ),
          child:Container()),
    );
  }
}*/
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    route();
  }

  route() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.login);
      /*
      navigation(context, const LoginPage());
*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Image(
                image: AssetImage(
                  'assets/images/akg-logo.png',
                ),
                height: height(context) * 0.06,
              ),
            ),
          ),
          Spacer(),
          Image(
            image: AssetImage('assets/images/splash-screen.png'),
            width: width(context) * 0.8,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "LOREM IPSUM DOLOR SIT AMET, CONSECTETUER ADIPISCING ELIT, SED DIAM NONUMMY NIBH EUISMOD TINCIDUNT UT LAOREET DOLORE MAGNA ALIQUAM ERAT VOLUTPAT.",
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
