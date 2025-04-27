import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amar_thikana/application/providers/property/property_form_provider.dart';

class RulesSelector extends ConsumerStatefulWidget {
  const RulesSelector({super.key});

  @override
  ConsumerState<RulesSelector> createState() => _RulesSelectorState();
}

class _RulesSelectorState extends ConsumerState<RulesSelector> {
  final List<Map<String, dynamic>> _rules = [
    {'rule': 'No Smoking', 'selected': false},
    {'rule': 'No Pets', 'selected': false},
    {'rule': 'No Parties', 'selected': false},
    {'rule': 'Students Only', 'selected': false},
    {'rule': 'Family Only', 'selected': false},
    {'rule': 'Bachelor Allowed', 'selected': false},
  ];

  final TextEditingController _customRuleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final currentRules = ref.read(propertyFormProvider).rules;
    for (var rule in _rules) {
      if (currentRules.contains(rule['rule'])) {
        rule['selected'] = true;
      }
    }
  }

  @override
  void dispose() {
    _customRuleController.dispose();
    super.dispose();
  }

  void _updateFormRules() {
    final selectedRules =
        _rules
            .where((r) => r['selected'] as bool)
            .map((r) => r['rule'] as String)
            .toList();
    ref.read(propertyFormProvider.notifier).updateRules(selectedRules);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'House Rules',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              _rules.map((rule) {
                return FilterChip(
                  selected: rule['selected'] as bool,
                  label: Text(rule['rule'] as String),
                  onSelected: (bool selected) {
                    setState(() {
                      rule['selected'] = selected;
                    });
                    _updateFormRules();
                  },
                );
              }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _customRuleController,
                decoration: const InputDecoration(
                  hintText: 'Add custom rule',
                  isDense: true,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (_customRuleController.text.isNotEmpty) {
                  setState(() {
                    _rules.add({
                      'rule': _customRuleController.text,
                      'selected': true,
                    });
                    _customRuleController.clear();
                  });
                  _updateFormRules();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
