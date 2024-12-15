import 'package:get_it/get_it.dart';
import 'package:project1/features/auth/data/repository/auth_repository.dart';
import 'package:project1/features/auth/data/web_services/auth_web_services.dart';
import 'package:project1/features/auth/logic/auth_cubit.dart';
import 'package:project1/features/home/data/repository/home_repository.dart';
import 'package:project1/features/home/data/web_services/home_web_services.dart';
import 'package:project1/features/home/logic/home_cubit.dart';

final sl = GetIt.instance;
Future<void> initGetIt() async {
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => AuthWebServices());

  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerLazySingleton(() => HomeRepository(sl()));
  sl.registerLazySingleton(() => HomeWebServices());
}
