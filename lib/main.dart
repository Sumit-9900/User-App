import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/core/theme/app_theme.dart';
import 'package:users_app/features/user/view/pages/user_page.dart';
import 'package:users_app/features/user/viewmodel/bloc/user_bloc.dart';
import 'package:users_app/features/user/viewmodel/cubit/theme_cubit.dart';
import 'package:users_app/init_dependencies.dart';

/// The main function of the application.
void main() async {
  // Set the status bar color to transparent.
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  // Ensure Flutter bindings are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies using GetIt.
  await initDependencies();

  // Run the app with multiple BlocProviders for dependency injection.
  runApp(
    MultiBlocProvider(
      providers: [
        // Provide the UserBloc and fetch initial user data.
        BlocProvider(
          create: (context) => getIt<UserBloc>()..add(UserFetched()),
        ),
        // Provide the ThemeCubit and load the saved theme preference.
        BlocProvider(create: (context) => getIt<ThemeCubit>()..loadTheme()),
      ],
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        return MaterialApp(
          title: 'Users App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          darkTheme: AppTheme.darkThemeMode,
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const UserPage(),
        );
      },
    );
  }
}
