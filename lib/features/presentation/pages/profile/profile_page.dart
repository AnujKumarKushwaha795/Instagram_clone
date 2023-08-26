import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../consts.dart';
import '../../cubit/auth/auth_cubit.dart';
import 'edit_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text(
          "Username",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                _openBottomModalSheet(context);
              },
              child: Icon(
                Icons.menu,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVer(8),
                          Text(
                            "Posts",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      sizeHor(25),
                      Column(
                        children: [
                          Text(
                            "500",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVer(8),
                          Text(
                            "Followers",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      sizeHor(25),
                      Column(
                        children: [
                          Text(
                            "100",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          sizeVer(8),
                          Text(
                            "Following",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              sizeVer(10),
              Text(
                "Name",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              sizeVer(10),
              Text(
                "The bio of user",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              sizeVer(10),
              GridView.builder(
                  itemCount: 32,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: secondaryColor,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _openBottomModalSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            decoration: BoxDecoration(color: backGroundColor.withOpacity(.8)),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "More Options",
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    sizeVer(8),
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PageConst.editProfilePage);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditProfilePage()));
                        },
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    sizeVer(7),
                    Divider(
                      thickness: 1,
                      color: secondaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                          BlocProvider.of<AuthCubit>(context).loggedOut();
                          Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
