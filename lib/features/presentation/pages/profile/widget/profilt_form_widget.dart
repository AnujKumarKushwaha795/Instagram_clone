import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class ProfileFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  const ProfileFormWidget({Key? key, this.controller, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title",style: TextStyle(color: primaryColor,fontSize: 16),),
        sizeVer(10),
        TextFormField(
          controller: controller,
          style: TextStyle(
          color: primaryColor,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
            labelStyle: TextStyle(color: primaryColor),
          ),
        ),
        Container(
          height: 1,width: double.infinity,
          color: secondaryColor,
        ),
      ],
    );
  }
}
