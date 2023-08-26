
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:instagram_clone/features/presentation/pages/credential/sign_in_page.dart';
import 'package:instagram_clone/features/presentation/pages/main_screen/main_screen.dart';
import '../../../../consts.dart';
import '../../widget/button_container_widget.dart';
import '../../widget/form_container_widget.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _usernameController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _bioController=TextEditingController();
  bool _signUp=false;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: backGroundColor,
      body:BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {
    // TODO: implement listener
        if(credentialState is CredentialSuccess){
          BlocProvider.of<AuthCubit>(context).loggedIn();
        }
       if(credentialState is CredentialFailure){
         toast("Invalid email and password");
       }

  },
  builder: (context, credentialState) {
    if(credentialState is CredentialSuccess){
       return BlocBuilder<AuthCubit,AuthState>(
        builder:(context,authState){
          if(authState is Authenticated){
            return MainScreen(uid: authState.uid);
            // return _bodyWidget();
          }
          else {
            return  _bodyWidget();
          }
        },
      );
    }
     return _bodyWidget();
  },
   ),
  );
  }

_bodyWidget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10.0 ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          // Center(child: SvgPicture.asset("lib/assets/ic_instagram.svg",color: Colors.white,)),
          Center(child:  instagram()),
          sizeVer(15),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 60,width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey,
                  ),
                  child: Icon(Icons.person,color: primaryColor,size: 60,),
                ),
                Positioned(
                    right: -5,
                    bottom: -5,
                    child: IconButton(
                      onPressed: (){
                      },
                      icon: Icon(Icons.add_a_photo,color: blueColor ,),

                    )),
              ],
            ),
          ),
          sizeVer(30),
          FormContainerWidget(
            controller: _usernameController,
            hintText:"Username",
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _emailController,
            hintText:"Email",
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _passwordController,
            hintText:"Password",
            isPasswordField: true,
          ),
          sizeVer(15),
          FormContainerWidget(
            controller: _bioController,
            hintText:"Bio",
          ),
          sizeVer(15),
          ButtonContainerWidget(
            color: Colors.blue,
            text: "SignUp",
            onTapListener: (){
              _signUpUser();
            },
          ),
          sizeVer(10),
          _signUp==true?Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Please wait",style: TextStyle(
                color: primaryColor,
                fontSize: 16,
              ),),
              sizeHor(10),
              CircularProgressIndicator(),
            ],
          ):Container(height: 0,width: 0,),

          Flexible(
            child: Container(),
            flex: 2,
          ),
          Divider(color: secondaryColor,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",style: TextStyle(color: primaryColor,fontSize: 20),),
              InkWell(
                onTap: (){
                  Navigator.pushNamedAndRemoveUntil(context, PageConst.signInPage, (route) => false);
                  // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInPage()),(route) => false);
                },
                child: Text("Sign In.",style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor,fontSize: 20),),
              )
            ],
          ),


        ],
      ),
    );
}

  void _signUpUser(){
    setState(() {
      _signUp=true;
    });
    BlocProvider.of<CredentialCubit>(context).signUpUser(
        user: UserEntity(
          email: _emailController.text,
          password: _passwordController.text,
          bio: _bioController.text,
          username: _usernameController.text,
          totalPost: 0,
          totalFollowers: 0,
          totalFollowing: 0,
          followers: [],
          following: [],
          website: "",
          name: "",
          profileUrl: "",
    )).then((value) => _clear());
  }
  _clear(){
    setState(() {
      _usernameController.clear();
      _passwordController.clear();
      _bioController.clear();
      _emailController.clear();
      _signUp=false;
    });
  }
}
