import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/features/user/repositories/user_local_repository.dart';

class ThemeCubit extends Cubit<bool> {
  final UserLocalRepository _userLocalRepository;
  ThemeCubit(this._userLocalRepository) : super(false);

  /// It toggles the theme from light mode to dark mode and vice versa
  void toggleTheme() async {
    final isDarkMode = !state;
    await _userLocalRepository.saveTheme(isDarkMode);
    emit(isDarkMode);
  }

  /// It loads the theme on the app launch
  void loadTheme() {
    final isDarkMode = _userLocalRepository.getTheme();
    emit(isDarkMode);
  }
}
