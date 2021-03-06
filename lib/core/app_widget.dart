import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_plantation/context/bloc/auth/auth_bloc.dart';
import 'package:smart_plantation/context/bloc/auth/auth_state.dart';
import 'package:smart_plantation/home/home_page.dart';
import 'package:smart_plantation/sign/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_plantation/sign/sign_up_page.dart';
import 'package:smart_plantation/splash/splash_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(AuthInitialState()),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green[400],
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        title: "Smart Plantation",
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
