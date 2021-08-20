import 'package:flutter/material.dart';
import 'package:smart_plantation/core/app_text_styles.dart';

class ProgressChartWidget extends StatefulWidget {
  const ProgressChartWidget({Key? key, this.progress = 0}) : super(key: key);
  final double progress;
  @override
  _ProgressChartWidgetState createState() => _ProgressChartWidgetState();
}

class _ProgressChartWidgetState extends State<ProgressChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 5, right: 5),
      child: Column(
        children: [
          buildMainChart(),
          Container(
            padding: const EdgeInsets.only(top: 16.0),
            width: double.maxFinite,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: buildIrrigationData(),
            ),
          )
        ],
      ),
    );
  }

  Column buildIrrigationData() {
    return Column(
      children: [
        buildTopIrrigationData(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Flexible(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                width: 1,
                color: Colors.white,
              ))),
              child: Text(
                "quantidade de água utilizada na ultima irrigação (10L)",
                style: AppTextStyles.heading10,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Row buildTopIrrigationData() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              "100% restantes para meta",
              style: AppTextStyles.heading10,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            child: Text("tempo estimado 1000 minutos",
                textAlign: TextAlign.center, style: AppTextStyles.heading10),
          ),
        ]);
  }

  SizedBox buildMainChart() {
    return SizedBox(
        height: 170,
        width: 170,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromRGBO(34, 34, 34, 0.5)),
                height: double.maxFinite,
                width: double.maxFinite,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: widget.progress / 100,
                  backgroundColor: Colors.indigo[600],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
            Center(
              child: Text(
                "${widget.progress.floor()} %",
                style: AppTextStyles.heading40,
              ),
            )
          ],
        ));
  }
}
