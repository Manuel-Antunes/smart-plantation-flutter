import 'package:flutter/material.dart';
import 'package:smart_plantation/common/plantation/plantation_statuses.dart';
import 'package:smart_plantation/components/header_widget.dart';
import 'package:smart_plantation/core/core.dart';
import 'package:smart_plantation/create_plantation/create_plantation.dart';
import 'package:smart_plantation/home/widgets/plantation_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: HeaderWidget(),
      backgroundColor:
          Color(int.parse("#191920".substring(1, 7), radix: 16) + 0xFF000000),
      floatingActionButton: buildFloattingActionButton(context),
    );
  }

  Padding buildBody() {
    return const Padding(
        padding: EdgeInsets.only(top: 10), child: PlantationListWidget());
  }

  Padding buildFloattingActionButton(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, right: 8),
      child: FloatingActionButton.large(
        child: const Icon(Icons.add),
        backgroundColor:
            Color(int.parse("#141419".substring(1, 7), radix: 16) + 0xFF000000),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePlantationPage(),
            ),
          );
        },
      ),
    );
  }
}
