import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/widget/form_container_widget.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool _isUserReplying=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        // leading: GestureDetector(
        //     onTap: ()=>Navigator.pop(context),
        //     child: Icon(Icons.arrow_back,color: primaryColor,)),
        title: Text("Comments",
          style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,width:40,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    sizeHor(10),
                    Text("Username",style: TextStyle(color: primaryColor,fontWeight:FontWeight.bold,fontSize: 15 )),
                  ],
                ),
                sizeVer(10),
                Text("This is description of post",style: TextStyle(color: primaryColor,)),
              ],
            ),
          ),

          sizeVer(10),
          Divider(color: secondaryColor,),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,width:40,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  sizeHor(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Username",style: TextStyle(color: primaryColor,fontWeight:FontWeight.bold,fontSize: 15 )),
                            Icon(Icons.favorite_border_outlined,color: darkGreyColor,),
                          ],
                        ),
                        sizeVer(4),
                        Text("Content of comment",style: TextStyle(color: primaryColor, )),
                        sizeVer(6),
                        Row(
                          children: [
                            Text("19/08/2002",style: TextStyle(color: darkGreyColor,fontSize: 12)),
                            sizeHor(15),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  _isUserReplying=!_isUserReplying;
                                });
                              },
                                child: Text("Reply",style: TextStyle(color: darkGreyColor, fontSize: 12))),
                            sizeHor(15),
                            Text("View Reply",style: TextStyle(color: darkGreyColor,fontSize: 12)),
                          ],
                        ),
                        _isUserReplying==true?sizeVer(10):sizeVer(0),
                        _isUserReplying==true?Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FormContainerWidget(
                              hintText: "Post your reply...",
                            ),
                            sizeVer(10),
                            Text("Post",style: TextStyle(color: blueColor),)
                          ],
                        ):Container(height: 0,width: 0,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // sizeVer(10),
          _commentSection(),
        ],
      ),
    );
  }

  _commentSection(){
    return Container(
      width: double.infinity,
      height: 55,
      color: Colors.grey[800],
      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              height: 40,width: 40,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            sizeHor(10),
            Expanded(
              child: TextFormField(
                style: TextStyle(
                  color: primaryColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Post your comment...",
                  hintStyle: TextStyle(color: secondaryColor),
                ),
              ),
            ),
            Text("Post",style: TextStyle(color: blueColor,fontSize: 15),),

          ],
        ),
      ),
    );
  }
}
