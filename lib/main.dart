import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whether_app/db/models/data_model.dart';
import 'package:whether_app/home/home_page.dart';
import 'package:whether_app/login/login/login_cubit.dart';
import 'package:whether_app/login/login_screen.dart';
import 'package:whether_app/onboarding/onboarding_screen.dart';
import 'package:whether_app/wheather/wheather/wheather_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogined = false;
  var isFirstTime = false;

  if (prefs.containsKey("isLogin")) {
    isLogined = prefs.getBool("isLogin") ?? false;
  } else {
    if (prefs.containsKey("isFirstTime")) {
      isFirstTime = prefs.getBool("isFirstTime") ?? false;
    } else {
      isFirstTime = false;
    }
    isLogined = false;
  }

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserDataModelAdapter().typeId)) {
    Hive.registerAdapter(UserDataModelAdapter());
  }
  runApp(MyApp(
    isLogin: isLogined != null ? isLogined : false,
    isFirstTime: isFirstTime != null ? isFirstTime : false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.isLogin, required this.isFirstTime});

  @override
  State<MyApp> createState() => _MyAppState();

  final bool isLogin;
  final bool isFirstTime;
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => WheatherCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Whether App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: widget.isLogin
              ? HomePage()
              : widget.isFirstTime
                  ? OnboardingScreen()
                  : OnboardingScreen(),
        ));
  }
}
