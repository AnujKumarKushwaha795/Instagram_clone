
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';

abstract class FirebaseRepository{
  // Credential
  Future<void> signInUser(UserEntity user);
  Future<void> signUpUser(UserEntity user);
  Future<bool> isSingIn();
  Future<void> singOut();

  // User
   Stream<List<UserEntity>>getUsers(UserEntity user);
   Stream<List<UserEntity>>getSingleUser(String uid);
   Future<String> getCurrentUid();
   Future<void> createUser(UserEntity user);
   Future<void> updateUser(UserEntity user);
}


