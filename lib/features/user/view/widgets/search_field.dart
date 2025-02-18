import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app/features/user/viewmodel/bloc/user_bloc.dart';

/// A search field widget for filtering users by name.
class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const SearchField({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: 'Search by name...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              controller.clear();
              focusNode.unfocus();
              context.read<UserBloc>().add(UserSearch(''));
            },
            icon: Icon(Icons.clear),
          ),
        ),
        onChanged: (query) {
          context.read<UserBloc>().add(UserSearch(query.trim()));
        },
      ),
    );
  }
}
