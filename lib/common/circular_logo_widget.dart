import 'package:flutter/material.dart';

class CircleAvatarLogo extends StatelessWidget {
  const CircleAvatarLogo({Key? key, required this.logoUrl}) : super(key: key);

  final String logoUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 23,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        maxRadius: 22,
        backgroundColor: const Color(0xffF9F6F6),
        backgroundImage: NetworkImage(logoUrl),
      ),
    );
  }
}
