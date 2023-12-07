import 'package:akgsetu/common/constants.dart';
import 'package:akgsetu/common/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/dependency_injection.dart';
import '../utils/storage_service.dart';
import '../utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  setup();
  Get.put(StorageService());
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

/*
  runApp(const MyApp());
*/
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', 'US'),
      ],
      initialRoute: Routes.root,
      getPages: AppPages.routes,
      title: Strings.appName,
      //title: 'AKG Setu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
/*
      home: const LoginPage(),
*/
    );
  }
}
