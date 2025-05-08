import 'dart:io';

import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  VoidCallback onPressed;
  File? selsectedImage;
   ProfileOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.selsectedImage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          color: selsectedImage==null? Colors.grey: Colors.red,
          onPressed: onPressed,
          icon: Icon(icon),
        ),
        Text(title,style: TextStyle(color: selsectedImage==null?Colors.grey:Colors.red),),
      ],
    );
  }
}
