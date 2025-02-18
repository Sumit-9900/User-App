// ignore_for_file: must_be_immutable

part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserError extends UserState {
  final String message;
  UserError(this.message);
}

final class UserSuccess extends UserState {
  final List<User> users;
  List<User> filterredUsers;
  UserSuccess(this.users) : filterredUsers = users;

  UserSuccess copyWith({List<User>? users, List<User>? filterredUsers}) {
    return UserSuccess(users ?? this.users)
      ..filterredUsers = filterredUsers ?? this.filterredUsers;
  }
}
