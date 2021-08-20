import 'package:flutter/material.dart';
import 'package:smart_plantation/common/user/user.dart';
import 'package:smart_plantation/core/app_text_styles.dart';

class HeaderWidget extends StatefulWidget implements PreferredSizeWidget {
  HeaderWidget({Key? key}) : super(key: key);
  final User loggedUser = User(
      email: "teste@teste.com",
      id: "123",
      name: "Manuel Antunes",
      photoUrl: "https://avatars.githubusercontent.com/u/57446204?v=4");
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor:
          Color(int.parse("#141419".substring(1, 7), radix: 16) + 0xFF000000),
      actions: [
        Center(child: Text(widget.loggedUser.name)),
        buildAvatar(widget.loggedUser.photoUrl)
      ],
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Smart Plantation',
          style: AppTextStyles.heading10,
        ),
      ),
    );
  }

  IconButton buildAvatar(String avatarUrl) {
    return IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        radius: 20,
      ),
    );
  }
}
