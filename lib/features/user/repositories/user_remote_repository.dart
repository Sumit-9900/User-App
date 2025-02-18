import 'package:fpdart/fpdart.dart';
import 'package:users_app/core/constants/api_url.dart';
import 'package:users_app/core/error/failure.dart';
import 'package:users_app/features/user/models/user_model.dart';
import 'package:http/http.dart' as http;

/// Abstract interface for user related data
abstract interface class UserRemoteRepository {
  Future<Either<Failure, List<User>>> getAllUsers();
}

/// Implementation of Abstract interface class of UserRemoteRepository
class UserRemoteRepositoryImpl implements UserRemoteRepository {
  final http.Client client;
  const UserRemoteRepositoryImpl(this.client);

  /// Fetches all the users from a public API
  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final url = Uri.parse(ApiUrl.usersUrl);
      final res = await http.get(url);

      // Returns an error message when the statuscode of the response is not 200
      if (res.statusCode != 200) {
        return left(Failure('Some unexpected error occurred!!!'));
      }

      // Fetches the List of users when the statuscode of the response is 200
      final users = userFromJson(res.body);

      return right(users);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
