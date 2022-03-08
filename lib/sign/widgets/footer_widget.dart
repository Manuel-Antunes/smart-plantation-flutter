import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_plantation/about/about_page.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
        child: RichText(
            text: TextSpan(
          text: "Don't know our project yet? ",
          children: <TextSpan>[
            TextSpan(
                text: 'click here ',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ),
                    );
                  },
                style: TextStyle(
                  color: Colors.blue,
                )),
            TextSpan(text: 'to learn more about!'),
          ],
        )),
      ),
    );
  }
}
