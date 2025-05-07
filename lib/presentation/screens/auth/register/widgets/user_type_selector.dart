import 'package:flutter/material.dart';
import '../../../../../domain/models/user/user_role.dart';

class UserTypeSelector extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onChanged;

  const UserTypeSelector({
    Key? key,
    required this.selectedRole,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('I am a:'),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildRoleOption(UserRole.renter),
            const SizedBox(width: 20),
            _buildRoleOption(UserRole.landlord),
          ],
        ),
      ],
    );
  }

  Widget _buildRoleOption(UserRole role) {
    return Expanded(
      child: RadioListTile<UserRole>(
        title: Text(role.displayName),
        value: role,
        groupValue: selectedRole,
        onChanged: (value) => onChanged(value!),
      ),
    );
  }
}
