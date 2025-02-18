import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/core/utils/show_snackbar.dart';
import 'package:users_app/core/widgets/loader.dart';
import 'package:users_app/features/user/view/widgets/search_field.dart';
import 'package:users_app/features/user/view/widgets/user_tile.dart';
import 'package:users_app/features/user/viewmodel/bloc/user_bloc.dart';
import 'package:users_app/features/user/viewmodel/cubit/theme_cubit.dart';

/// A User Page widget that displays the List of users
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Users'),
              centerTitle: true,
              elevation: 1,
              leading: IconButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                icon:
                    !isDarkMode
                        ? Icon(Icons.dark_mode, color: Colors.black)
                        : Icon(Icons.light_mode, color: Colors.amberAccent),
              ),
            ),
            body: Column(
              children: [
                SearchField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                ),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserError) {
                      showSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return Loader();
                    } else if (state is UserSuccess) {
                      final users = state.filterredUsers;
                      if (users.isEmpty) {
                        return Expanded(
                          child: const Center(
                            child: Text('No users to display.'),
                          ),
                        );
                      }

                      return Expanded(
                        child: RefreshIndicator.adaptive(
                          color: Theme.of(context).progressIndicatorTheme.color,
                          onRefresh: () async {
                            context.read<UserBloc>().add(UserFetched());
                          },
                          child: Scrollbar(
                            thickness: 4,
                            thumbVisibility: true,
                            radius: Radius.circular(6),
                            interactive: true,
                            child: ListView.builder(
                              itemCount: users.length,
                              itemBuilder: (context, index) {
                                final user = users[index];
                                return UserTile(user: user);
                              },
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
