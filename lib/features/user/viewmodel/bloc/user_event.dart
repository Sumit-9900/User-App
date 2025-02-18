part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class UserFetched extends UserEvent {}

final class UserSearch extends UserEvent {
  final String query;
  UserSearch(this.query);
}
