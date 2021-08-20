import 'package:flutter/material.dart';
import 'package:smart_plantation/core/app_text_styles.dart';
import 'package:smart_plantation/sign/widgets/login_form_widget.dart';
import 'package:smart_plantation/sign/widgets/span_landscape_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(int.parse("#191920".substring(1, 7), radix: 16) + 0xFF000000),
      body: buildBody(context),
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SpanLandscape(),
            Text(
              "Login",
              style: AppTextStyles.heading60,
            ),
            const LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
