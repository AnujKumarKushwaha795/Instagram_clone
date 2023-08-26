import 'package:flutter/material.dart';

import '../../../../consts.dart';

class UploadPostPage extends StatelessWidget {
  const UploadPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
       body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 height: 150,width: 150,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: secondaryColor.withOpacity(.3),
                 ),
                 child: Center(child: Icon(Icons.upload,color: primaryColor,size: 40,)),
               ),
             ],
           )
       ),
    );
  }
}