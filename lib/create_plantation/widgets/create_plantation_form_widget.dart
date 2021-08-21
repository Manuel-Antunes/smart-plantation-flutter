import 'package:flutter/material.dart';
import 'package:smart_plantation/home/home_page.dart';

class CreatePlantationFormWidget extends StatefulWidget {
  const CreatePlantationFormWidget({Key? key}) : super(key: key);

  @override
  _CreatePlantationFormWidgetState createState() =>
      _CreatePlantationFormWidgetState();
}

class _CreatePlantationFormWidgetState
    extends State<CreatePlantationFormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: buildFormControllers(),
        ),
      ),
    );
  }

  Column buildFormControllers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: buildInputDecoration('Name *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Objective umidity *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Flow rate *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          obscureText: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Description *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          obscureText: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        generateFormButton(
            content: "Create",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }),
      ],
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      fillColor: Colors.white,
      labelText: labelText,
      filled: true,
    );
  }

  Padding generateFormButton(
      {required String content,
      IconData? icon,
      required final void Function() onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            minimumSize: const Size(double.infinity, 30),
            primary: Colors.green[600]),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon != null
                  ? Icon(
                      icon,
                      color: Colors.white,
                    )
                  : null,
            ),
            Text(content)
          ],
        ),
      ),
    );
  }
}
