import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/features/presentation/pages/post/comment/comment_page.dart';
import '../../../../consts.dart';
import '../post/update_post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title:  instagram(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(MaterialCommunityIcons.facebook_messenger,color: primaryColor,),
          )
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Container(
                       height: 30,width: 30,
                       decoration: BoxDecoration(
                         color: secondaryColor,
                         shape: BoxShape.circle
                       ),
                     ),
                     sizeHor(10),
                     Text("Username",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                   ],
                 ),
                 GestureDetector(
                   onTap: (){
                     _openBottomModalSheet(context);
                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePostPage()));
                   },
                     child: Icon(Icons.more_vert,color: primaryColor,)),
               ],
             ),
             sizeVer(10),
             Container(
               width: double.infinity,
               height: MediaQuery.of(context).size.height * 0.30,
               color: secondaryColor,
             ),
             sizeVer(10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Icon(Icons.favorite,color: primaryColor,),
                     sizeHor(10),
                     GestureDetector(
                         onTap: ()=>Navigator.pushNamed(context, PageConst.commentPage),
                         // onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentPage())),
                         child: Icon(Feather.message_circle,color: primaryColor,)),
                     sizeHor(10),
                     Icon(Feather.send,color: primaryColor,),
                   ],
                 ),
                 Icon(Icons.bookmark_border,color: primaryColor,),
               ],
             ),
             sizeVer(10 ),
             Text("1 likes",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
             sizeVer(10),
             Row(
               children: [
                 Text("Username",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),),
                 sizeHor(10),
                 Text("some description",style: TextStyle(color: primaryColor, ),),
               ],
             ),
             Text("view all 10 comments",style: TextStyle(color: darkGreyColor,),),
             sizeVer(10),
             Text("15/08/2023",style: TextStyle(color: darkGreyColor,),),
           ],
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

                        },
                        child: Text(
                          "Delete Post",
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
                          Navigator.pushNamed(context, PageConst.updatePostPage);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePostPage()));
                        },
                        child: Text(
                          "Update Post",
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
