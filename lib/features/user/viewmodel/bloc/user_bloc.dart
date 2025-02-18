import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/features/user/models/user_model.dart';
import 'package:users_app/features/user/repositories/user_remote_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRemoteRepository _userRemoteRepository;
  UserBloc(this._userRemoteRepository) : super(UserInitial()) {
    /// Bloc Event to fetch the list of users
    on<UserFetched>(onGetAllUsers);

    /// Bloc Event to fetch the list of filterred users
    on<UserSearch>(onGetFilterredUsers);
  }

  void onGetAllUsers(UserFetched event, Emitter<UserState> emit) async {
    // Emit the UserLoading State
    emit(UserLoading());

    final res = await _userRemoteRepository.getAllUsers();

    // Emit the UserError state in case of error and UserSuccess state in case of success
    res.fold((l) => emit(UserError(l.message)), (r) => emit(UserSuccess(r)));
  }

  void onGetFilterredUsers(UserSearch event, Emitter<UserState> emit) {
    if (state is UserSuccess) {
      final currentState = state as UserSuccess;
      final query = event.query.trim().toLowerCase();

      // Checks whether the user name from the list of users matches with the search query
      final filterredUsers =
          currentState.users
              .where((user) => user.name.trim().toLowerCase().contains(query))
              .toList();

      // Updating the UserSuccess State with the modified filterredUsers list
      emit(currentState.copyWith(filterredUsers: filterredUsers));
    }
  }
}
