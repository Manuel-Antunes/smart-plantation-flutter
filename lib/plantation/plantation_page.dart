import 'package:flutter/material.dart';
import 'package:smart_plantation/components/header_widget.dart';
import 'package:smart_plantation/core/app_images.dart';
import 'package:smart_plantation/core/core.dart';
import 'package:smart_plantation/plantation/widgets/progress_chart_widget.dart';

class PlantationPage extends StatelessWidget {
  const PlantationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      backgroundColor:
          Color(int.parse("#141419".substring(1, 7), radix: 16) + 0xFF000000),
      body: buildBody(),
    );
  }

  Center buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Container(
            decoration: BoxDecoration(
                color: Color(int.parse("#191920".substring(1, 7), radix: 16) +
                    0xFF000000),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: ListView(
              children: [
                SizedBox(
                  height: 250,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.landscape),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Plantação 1",
                      style: AppTextStyles.heading40,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const ProgressChartWidget(
                  progress: 76,
                ),
                buildLegend()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildLegend() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Container(
        decoration: BoxDecoration(
            color: Color(
                int.parse("#141419".substring(1, 7), radix: 16) + 0xFF000000),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Text(
                  "Humidade atual do solo",
                  style: AppTextStyles.titleBoldWhite,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.indigo[500]),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
                Text(
                  "Humidade objetiva do solo",
                  style: AppTextStyles.titleBoldWhite,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
