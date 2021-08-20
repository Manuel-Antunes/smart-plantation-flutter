import 'package:flutter/material.dart';
import 'package:smart_plantation/core/app_text_styles.dart';
import 'package:smart_plantation/login/widgets/form_widget.dart';
import 'package:smart_plantation/login/widgets/span_landscape_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SpanLandscape(),
          Text(
            "Login",
            style: AppTextStyles.heading60,
          ),
          Container(
            child: const FormWidget(),
          ),
        ],
      ),
    );
  }
}
