import 'package:flutter/material.dart';
import 'package:smart_plantation/common/user/user.dart';
import 'package:smart_plantation/core/core.dart';
import 'package:smart_plantation/data/user_dao.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1500), () async {
      User? user = await UserDao().getUser();
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home', arguments: user.name);
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Stack(
          alignment: const Alignment(0, 0),
          children: [
            Image.asset(AppImages.landscape),
            Text(
              "Smart Plantation",
              style: AppTextStyles.heading40,
            )
          ],
        ),
      ),
    );
  }
}
