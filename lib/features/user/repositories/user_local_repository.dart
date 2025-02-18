import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_app/core/error/failure.dart';

/// Abstract interface for managing theme related data
abstract interface class UserLocalRepository {
  Future<Either<Failure, void>> saveTheme(bool isDarkMode);
  bool getTheme();
}

/// Implementation of Abstract interface class of UserLocalRepository
class UserLocalRepositoryImpl implements UserLocalRepository {
  final SharedPreferences sharedPreferences;
  UserLocalRepositoryImpl(this.sharedPreferences);

  /// Fetches the theme from SharedPreferences(local storage)
  @override
  bool getTheme() {
    return sharedPreferences.getBool('isDarkMode') ?? false;
  }

  /// Saves the theme to SharedPreferences
  @override
  Future<Either<Failure, void>> saveTheme(bool isDarkMode) async {
    try {
      await sharedPreferences.setBool('isDarkMode', isDarkMode);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
