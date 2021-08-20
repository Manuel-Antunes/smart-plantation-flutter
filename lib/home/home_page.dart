import 'package:flutter/material.dart';
import 'package:smart_plantation/common/plantation/plantation_statuses.dart';
import 'package:smart_plantation/components/header_widget.dart';
import 'package:smart_plantation/core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: HeaderWidget(),
      backgroundColor:
          Color(int.parse("#191920".substring(1, 7), radix: 16) + 0xFF000000),
      floatingActionButton: buildFloattingActionButton(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView(children: [
        buildPlantationListItem("Plantação top 1",
            image: const NetworkImage(
                "https://avatars.githubusercontent.com/u/57446204?v=4")),
        buildPlantationListItem("Plantação top 2"),
        buildPlantationListItem("Plantação top 2"),
      ]),
    );
  }

  Padding buildFloattingActionButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 8),
      child: FloatingActionButton.large(
        child: const Icon(Icons.add),
        backgroundColor:
            Color(int.parse("#141419".substring(1, 7), radix: 16) + 0xFF000000),
        onPressed: () {},
      ),
    );
  }

  Padding buildPlantationListItem(String name,
      {ImageProvider? image,
      PLANTATION_STATUSES status = PLANTATION_STATUSES.inactive}) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          print(name);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green[700],
          padding: const EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 30),
        ),
        child: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: image ?? AssetImage(AppImages.landscape)))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(name, style: AppTextStyles.titleBoldWhite),
                  Text(status.toString().split(".").last,
                      style: AppTextStyles.body20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
