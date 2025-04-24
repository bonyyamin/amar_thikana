import 'package:flutter/material.dart';

enum UserRole { renter, landlord }

class UserTypeSelector extends StatelessWidget {
  final UserRole selectedRole;
  final ValueChanged<UserRole> onChanged;

  const UserTypeSelector({
    required this.selectedRole,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("I am a:", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        Row(
          children: [
            Expanded(
              child: RadioListTile<UserRole>(
                title: const Text('Renter'),
                subtitle: const Text('Looking for a place'),
                value: UserRole.renter,
                groupValue: selectedRole,
                onChanged: (role) {
                  if (role != null) {
                    onChanged(role);
                  }
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RadioListTile<UserRole>(
                title: const Text('HomeOwner'),
                subtitle: const Text('Listing a place'),
                value: UserRole.landlord,
                groupValue: selectedRole,
                onChanged: (role) {
                  if (role != null) {
                    onChanged(role);
                  }
                },
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
