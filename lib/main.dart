import 'package:alarm/alarm.dart';
import 'package:clock_analog/res/constants.dart';
import 'package:clock_analog/view/splash_view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Alarm.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.white,
          hourMinuteColor: Colors.transparent,
          entryModeIconColor: Colors.pinkAccent,
          dialHandColor: Colors.pinkAccent,
          dialBackgroundColor: Colors.transparent,
          dayPeriodShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide.none,
          )


        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen()
    );
  }
}

