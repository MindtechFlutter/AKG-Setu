import 'package:akgsetu/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', 'US'),
      ],
      title: 'AKG Setu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

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
    Future.delayed(const Duration(seconds: 2), () {
      navigation(context, const LoginPage());
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
