import 'package:flutter/material.dart';
import 'package:smart_plantation/core/app_text_styles.dart';
import 'package:smart_plantation/sign/widgets/sign_up_form_widget.dart';
import 'package:smart_plantation/sign/widgets/span_landscape_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Sign Up",
              style: AppTextStyles.heading60,
            ),
            const SignUpFormWidget(),
          ],
        ),
      ),
    );
  }
}
