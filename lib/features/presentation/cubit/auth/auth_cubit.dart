import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/is_sign_in_usecase.dart';

import '../../../domain/usecases/firebase_usecase/user/get_current_uid_usecase.dart';
import '../../../domain/usecases/firebase_usecase/user/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;

  AuthCubit(
      {required this.signOutUseCase,
      required this.isSignInUseCase,
      required this.getCurrentUidUseCase})
      : super(AuthInitial());

  Future<void> appStarted(BuildContext context) async {
    try {
      bool isSignIn = await isSignInUseCase.call();
      if (isSignIn == true) {
        final uid = getCurrentUidUseCase.call().toString();
        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

Future<void>loggedIn()async{
    try{
      final uid=getCurrentUidUseCase.call().toString();
      emit(Authenticated(uid: uid));
    }catch(_){
      emit(UnAuthenticated());
    }
}

Future<void>loggedOut()async{
    try{
      await signOutUseCase.call();
      emit(UnAuthenticated());
    }catch(_){
      emit(UnAuthenticated());
    }
}




}
