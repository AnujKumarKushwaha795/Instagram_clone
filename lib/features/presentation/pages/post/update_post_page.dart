import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/pages/profile/widget/profilt_form_widget.dart';

class UpdatePostPage extends StatelessWidget {
  const UpdatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.close,color: primaryColor,size: 32,)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.done,color: blueColor,size: 32,),
          ),
        ],
        backgroundColor: backGroundColor,
        title: Text("Edit Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 100,width: 100,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              sizeVer(10),
              Center(child: Text("Username",style: TextStyle(color: primaryColor,fontSize: 16,fontWeight: FontWeight.bold),)),
              sizeVer(10),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: secondaryColor,
                ),
              ),
              sizeVer(10),
              ProfileFormWidget(
                title: "Description",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
