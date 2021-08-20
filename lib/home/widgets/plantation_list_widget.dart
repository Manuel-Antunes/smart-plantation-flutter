import 'package:flutter/material.dart';
import 'package:smart_plantation/common/plantation/PLANTATION_STATUSES.dart';
import 'package:smart_plantation/core/app_images.dart';
import 'package:smart_plantation/core/app_text_styles.dart';
import 'package:smart_plantation/plantation/plantation_page.dart';

class PlantationListWidget extends StatefulWidget {
  const PlantationListWidget({Key? key}) : super(key: key);

  @override
  _PlantationListWidgetState createState() => _PlantationListWidgetState();
}

class _PlantationListWidgetState extends State<PlantationListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildPlantationListItem("Plantação top 1",
          image: const NetworkImage(
              "https://avatars.githubusercontent.com/u/57446204?v=4")),
      buildPlantationListItem("Plantação top 2"),
      buildPlantationListItem("Plantação top 2"),
    ]);
  }

  Padding buildPlantationListItem(String name,
      {ImageProvider? image,
      PLANTATION_STATUSES status = PLANTATION_STATUSES.inactive}) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlantationPage(),
            ),
          );
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
