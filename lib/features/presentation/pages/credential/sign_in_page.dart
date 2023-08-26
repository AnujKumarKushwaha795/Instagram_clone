import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/consts.dart';
import 'package:instagram_clone/features/presentation/pages/credential/sign_up_page.dart';
import 'package:instagram_clone/features/presentation/widget/button_container_widget.dart';
import 'package:instagram_clone/features/presentation/widget/form_container_widget.dart';

import '../../../domain/entities/user/user_entity.dart';
import '../../cubit/auth/auth_cubit.dart';
import '../../cubit/credential/credential_cubit.dart';
import '../main_screen/main_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
 bool _isSignIn=false;

@override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
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
        sizeVer(30),
        FormContainerWidget(
          hintText:"Email",
        ),
        sizeVer(15),
        FormContainerWidget(
          hintText:"Password",
          isPasswordField: true,
        ),
        sizeVer(15),
        ButtonContainerWidget(
          color: Colors.blue,
          text: "SignIn",
          onTapListener: (){
            _signInUser();
          },
        ),
        sizeVer(10),
        _isSignIn==true?Row(
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
          /*
              the Flexible widgets with the empty Container as their child are being used to create flexible spaces at the top and bottom of the layout. These spaces help in centering the main content of the page vertically by pushing it towards the middle of the screen.
              The flexible spaces act as buffers, allowing the "Instagram" title and the form elements to be positioned closer to the vertical center of the screen, even when the keyboard appears.
              In summary, the purpose of the line Flexible(child: Container(), flex: 2,) is to create a flexible space with a flex factor of 2 that helps in centering the main content of the SignInPage vertically within the available space.
               */
          flex: 2,
        ),
        Divider(color: secondaryColor,), //the Divider widget is being used to create a visual separation between the main content of the sign-in page and the "Don't have an account?" text along with the "Sign Up" link.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?",style: TextStyle(color: primaryColor,fontSize: 20),),
            InkWell(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, PageConst.signUpPage, (route) => false);
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignUpPage()),(route) => false);
              },
              child: Text("Sign Up.",style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor,fontSize: 20),),
            )
          ],
        )


      ],
    ),
  );
}

  void _signInUser(){
    setState(() {
      _isSignIn=true;
    });
    BlocProvider.of<CredentialCubit>(context).signInUser(email: _emailController.text, password: _passwordController.text).then((value) => _clear());
  }
  _clear(){
    setState(() {
      _passwordController.clear();
      _emailController.clear();
      _isSignIn=false;
    });
  }

}
