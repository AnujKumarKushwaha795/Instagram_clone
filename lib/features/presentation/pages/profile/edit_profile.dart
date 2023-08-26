import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/pages/profile/widget/profilt_form_widget.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: primaryColor),
        ),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.close,
              color: primaryColor,
              size: 32,
            )),
        actions: [
          Icon(
            Icons.done,
            color: Colors.blue,
            size: 32,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: secondaryColor,
                  ),
                ),
              ),
              sizeVer(15),
              Text(
                "Change profile photo",
                style: TextStyle(
                    color: blueColor, fontWeight: FontWeight.w400, fontSize: 20),
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Name",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Username",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Wedsite",
              ),
              sizeVer(15),
              ProfileFormWidget(
                title: "Bio",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

