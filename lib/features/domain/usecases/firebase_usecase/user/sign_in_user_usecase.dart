
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';

import '../../../repository/firebase_repository.dart';

class SignInUserUseCase{
  final FirebaseRepository repository;
  SignInUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.signInUser(user);
  }
}