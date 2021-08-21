import 'package:flutter/material.dart';
import 'package:smart_plantation/components/header_widget.dart';
import 'package:smart_plantation/core/app_text_styles.dart';
import 'package:smart_plantation/create_plantation/widgets/create_plantation_form_widget.dart';

class CreatePlantationPage extends StatelessWidget {
  const CreatePlantationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      backgroundColor:
          Color(int.parse("#191920".substring(1, 7), radix: 16) + 0xFF000000),
      body: buildBody(context),
    );
  }

  SingleChildScrollView buildBody(context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.14,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Container(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(int.parse("#141419".substring(1, 7), radix: 16) +
                    0xFF000000),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Text(
                    "Plantation Register",
                    style: AppTextStyles.bodyWhite20,
                  ),
                  CreatePlantationFormWidget(),
                  Text(
                    "make your plantation smarter",
                    style: AppTextStyles.bodyBold,
                    textAlign: TextAlign.right,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
