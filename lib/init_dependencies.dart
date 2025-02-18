import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_app/features/user/repositories/user_local_repository.dart';
import 'package:users_app/features/user/repositories/user_remote_repository.dart';
import 'package:users_app/features/user/viewmodel/bloc/user_bloc.dart';
import 'package:users_app/features/user/viewmodel/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => prefs);

  getIt.registerLazySingleton(() => http.Client());

  getIt.registerFactory<UserLocalRepository>(
    () => UserLocalRepositoryImpl(getIt()),
  );

  getIt.registerFactory<UserRemoteRepository>(
    () => UserRemoteRepositoryImpl(getIt()),
  );

  getIt.registerFactory(() => ThemeCubit(getIt()));

  getIt.registerFactory(() => UserBloc(getIt()));
}
