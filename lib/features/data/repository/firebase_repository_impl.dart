import 'package:instagram_clone/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) async=>remoteDataSource.createUser(user);

  @override
  Future<String> getCurrentUid()async=>remoteDataSource.getCurrentUid();

  @override
  Stream<List<UserEntity>> getSingleUser(String uid)=>remoteDataSource.getSingleUser(uid);

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) =>remoteDataSource.getUsers(user);

  @override
  Future<bool> isSingIn() async=>remoteDataSource.isSingIn();

  @override
  Future<void> signInUser(UserEntity user)async=>remoteDataSource.signInUser(user);

  @override
  Future<void> signUpUser(UserEntity user)async=>remoteDataSource.signUpUser(user);

  @override
  Future<void> singOut() async=>remoteDataSource.singOut();

  @override
  Future<void> updateUser(UserEntity user) async=>remoteDataSource.updateUser(user);
}
