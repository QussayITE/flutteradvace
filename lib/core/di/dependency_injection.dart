import 'package:dio/dio.dart';
import 'package:flutteradvace/core/networking/api_service.dart';
import 'package:flutteradvace/core/networking/dio_factory.dart';
import 'package:flutteradvace/features/login/data/repos/login_repo.dart';
import 'package:flutteradvace/features/login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  //home
}
