import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/sign_up_user_usecase.dart';

import '../../../domain/usecases/firebase_usecase/user/sign_in_user_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUserUseCase signInUserUseCase;
  final SignUpUserUseCase signUpUseCase;
  CredentialCubit({required this.signUpUseCase,required this.signInUserUseCase}) : super(CredentialInitial());

  Future<void> signInUser({required String email,required String password})async{
    emit(CredentialLoading());
    try{
      await signInUserUseCase.call(UserEntity(email: email,password: password));
      emit(CredentialSuccess());
    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }
  Future<void> signUpUser({required UserEntity user})async{
    emit(CredentialLoading());
    try{
      await signUpUseCase.call(user);
      emit(CredentialSuccess());
    }on SocketException catch(_){
      emit(CredentialFailure());
    }catch(_){
      emit(CredentialFailure());
    }
  }

}
