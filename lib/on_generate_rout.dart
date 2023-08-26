

// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/pages/credential/sign_in_page.dart';
import 'package:instagram_clone/features/presentation/pages/credential/sign_up_page.dart';
import 'package:instagram_clone/features/presentation/pages/post/comment/comment_page.dart';
import 'package:instagram_clone/features/presentation/pages/post/update_post_page.dart';
import 'package:instagram_clone/features/presentation/pages/profile/edit_profile.dart';

class OnGenerateRoute{
    static Route<dynamic>? route(RouteSettings settings){
      final args=settings.arguments;

      switch(settings.name){
       case PageConst.editProfilePage:{return routeBuilder(EditProfilePage());}
       case PageConst.commentPage:{return routeBuilder(CommentPage());}
       case PageConst.signInPage:{return routeBuilder(SignInPage());}
       case PageConst.signUpPage:{return routeBuilder(SignUpPage());}
       case PageConst.updatePostPage:{return routeBuilder(UpdatePostPage());}
       default:{
          NoPageFound();
        }

      }
    }
}
dynamic routeBuilder(Widget child){
  return MaterialPageRoute(builder: (context)=>child);
}
class NoPageFound extends StatelessWidget {
  const NoPageFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text("No page found",style: TextStyle(color: primaryColor),),

      ),
      body: Container(
            child:Text("No page found",style: TextStyle(color: primaryColor),),
      ),
    );
  }
}
