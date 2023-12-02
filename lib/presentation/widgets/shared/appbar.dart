import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const avatarImage = NetworkImage(
        'https://i.pinimg.com/474x/c9/85/52/c98552956665393920c4dc005712fd8c.jpg');
    return AppBar(
      leading: const BackButton(),
      title: const Text('Mi amor'),
      centerTitle: false,
      actions: const [
        Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: avatarImage,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
