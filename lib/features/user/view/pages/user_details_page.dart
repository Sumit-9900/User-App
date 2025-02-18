import 'package:flutter/material.dart';
import 'package:users_app/features/user/models/user_model.dart';

/// A User Details Page widget that displays the information of particular user
class UserDetailsPage extends StatelessWidget {
  final User user;
  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(context),
            const SizedBox(height: 20),
            _buildSection(context, 'Address', [
              _buildDetailItem(context, 'Street', user.address.street),
              _buildDetailItem(context, 'Suite', user.address.suite),
              _buildDetailItem(context, 'City', user.address.city),
              _buildDetailItem(context, 'Zipcode', user.address.zipcode),
              _buildDetailItem(
                context,
                'Geo',
                '${user.address.geo.lat}, ${user.address.geo.lng}',
              ),
            ]),
            const SizedBox(height: 20),
            _buildSection(context, 'Company', [
              _buildDetailItem(context, 'Name', user.company.name),
              _buildDetailItem(
                context,
                'Catch Phrase',
                user.company.catchPhrase,
              ),
              _buildDetailItem(context, 'BS', user.company.bs),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailItem(context, 'Username', user.username),
            _buildDetailItem(context, 'Email', user.email),
            _buildDetailItem(context, 'Phone', user.phone),
            _buildDetailItem(context, 'Website', user.website),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: theme.dividerColor,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          color: theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: theme.dividerColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: theme.textTheme.bodyLarge!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
