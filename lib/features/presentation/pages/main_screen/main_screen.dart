import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/pages/activity/activity_page.dart';
import 'package:instagram_clone/features/presentation/pages/home/home_page.dart';
import 'package:instagram_clone/features/presentation/pages/post/upload_post_page.dart';
import 'package:instagram_clone/features/presentation/pages/profile/profile_page.dart';
import 'package:instagram_clone/features/presentation/pages/search/search_page.dart';

class MainScreen extends StatefulWidget {
  final String uid;
  const MainScreen({Key? key,required this.uid}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex=0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    pageController=PageController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }
  void navigationTapped(int index){
    pageController.jumpToPage(index);
  }
  void onPageChanged(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: backGroundColor,
        items: [
           BottomNavigationBarItem(icon: Icon(MaterialCommunityIcons.home_variant,color: primaryColor,),label: ""),
           BottomNavigationBarItem(icon: Icon(Ionicons.md_search,color: primaryColor,),label: ""),
           BottomNavigationBarItem(icon: Icon(Ionicons.md_add_circle,color: primaryColor,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.favorite,color: primaryColor,),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,color: primaryColor,),label: ""),

        ],
      onTap: navigationTapped,
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          SearchPage(),
          UploadPostPage(),
          ActivityPage(),
          ProfilePage(),
        ],
        onPageChanged: onPageChanged,
      ),
    );
  }
}
