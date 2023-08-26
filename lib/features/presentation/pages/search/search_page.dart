import 'package:flutter/material.dart';
import 'package:instagram_clone/features/presentation/pages/search/widget/search_widget.dart';

import '../../../../consts.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SearchWidget(controller: _searchController),
                 sizeVer(10),
                 GridView.builder(itemCount: 32,physics: ScrollPhysics(),shrinkWrap: true,
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5),
                     itemBuilder: (context,index){
                      return Container(
                     height: 100,width: 100,
                     color: secondaryColor,
                   );
                 }),
               ],
           ),
         ),
       ),
      ),
    );
  }
}