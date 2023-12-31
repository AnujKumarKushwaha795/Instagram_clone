
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';

import '../../../repository/firebase_repository.dart';

class SignUpUserUseCase{
  final FirebaseRepository repository;
  SignUpUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.signUpUser(user);
  }
}