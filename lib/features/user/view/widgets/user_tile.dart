import 'package:flutter/material.dart';
import 'package:users_app/features/user/models/user_model.dart';
import 'package:users_app/features/user/view/pages/user_details_page.dart';

/// A User Card widget that display the user's name and email address
class UserTile extends StatelessWidget {
  final User user;
  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => UserDetailsPage(user: user)),
          );
        },
      ),
    );
  }
}
