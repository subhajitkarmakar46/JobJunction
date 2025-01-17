import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobjunction/controllers/chat_provider.dart';
import 'package:jobjunction/controllers/exports.dart';
import 'package:jobjunction/firebase_options.dart';
import 'package:jobjunction/views/ui/auth/login.dart';
import 'package:jobjunction/views/ui/mainscreen.dart';
import 'package:jobjunction/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/common/exports.dart';

Widget defaultHomeScreen = const OnBoardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final entrypoint = prefs.getBool('entrypoint') ?? false;
  final loggedIn = prefs.getBool('loggedIn') ?? false;

  if (entrypoint && !loggedIn) {
    defaultHomeScreen = const LoginPage();
  } else if (entrypoint && loggedIn) {
    defaultHomeScreen = const Mainscreen();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => ZoomNotifier()),
    ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    ChangeNotifierProvider(create: (context) => JobsNotifier()),
    ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
    ChangeNotifierProvider(create: (context) => ImageUploader()),
    ChangeNotifierProvider(create: (context) => ProfileNotifier()),
    ChangeNotifierProvider(create: (context) => ChatNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Jobjunction',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(kLight.value),
              iconTheme: IconThemeData(color: Color(kDark.value)),
              primarySwatch: Colors.grey,
            ),
            home: defaultHomeScreen,
          );
        });
  }
}
