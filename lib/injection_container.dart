import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/features/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:instagram_clone/features/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:instagram_clone/features/data/repository/firebase_repository_impl.dart';
import 'package:instagram_clone/features/domain/repository/firebase_repository.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/create_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/get_current_uid_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/get_single_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/get_users_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/is_sign_in_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/sign_in_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/sign_out_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/sign_up_user_usecase.dart';
import 'package:instagram_clone/features/domain/usecases/firebase_usecase/user/update_user_usecase.dart';
import 'package:instagram_clone/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_clone/features/presentation/cubit/user/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  // this give new instance each time when request it.
  sl.registerFactory(() =>
      AuthCubit(
      signOutUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      getCurrentUidUseCase: sl.call(),
    ),
  );
  sl.registerFactory(() =>
      CredentialCubit(
          signUpUseCase: sl.call(),
          signInUserUseCase: sl.call()));

  sl.registerFactory(() =>
      UserCubit(
          updateUserUseCase: sl.call(),
          getUsersUseCase: sl.call()));
  sl.registerFactory(() =>
      GetSingleUserCubit(
          getSingleUserUseCase: sl.call()));

// Use case
  // this give new instance only for first time. whole life time of class it will give same instance
  sl.registerLazySingleton(() =>SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>SignInUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>SignUpUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>UpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>GetUsersUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>GetSingleUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>CreateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton(() =>GetCurrentUidUseCase(repository: sl.call()));

// Repository
  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
// Remote data source
sl.registerLazySingleton<FirebaseRemoteDataSource>(() => FirebaseRemoteDataSourceImp(firebaseFirestore: sl.call(), firebaseAuth: sl.call()));

// External
final firebaseFirestore=FirebaseFirestore.instance;
final firebaseAuth=FirebaseAuth.instance;

sl.registerLazySingleton(() => firebaseFirestore);
sl.registerLazySingleton(() => firebaseAuth);

}
