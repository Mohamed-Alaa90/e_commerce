import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_consumer.dart';
import 'package:e_commerce/core/api/dio_consumer.dart';
import 'package:e_commerce/screens/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/screens/main/cubit/main_navi_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt<ApiConsumer>()));
  getIt.registerLazySingleton<MainNavigatorCubit>(() => MainNavigatorCubit());
}
