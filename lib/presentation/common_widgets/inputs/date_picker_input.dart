import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:amar_thikana/core/theme/app_colors.dart';

class DatePickerInput extends StatelessWidget {
  final String? label;
  final String hint;
  final DateTime? value;
  final Function(DateTime?) onChanged;
  final String? Function(DateTime?)? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DatePickerInput({
    super.key,
    this.label,
    required this.hint,
    this.value,
    required this.onChanged,
    this.validator,
    this.firstDate,
    this.lastDate,
  });

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: value ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
        ],
        InkWell(
          onTap: () => _showDatePicker(context),
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              suffixIcon: const Icon(Icons.calendar_today, size: 20),
            ),
            child: Text(
              value != null ? DateFormat('MMM dd, yyyy').format(value!) : hint,
              style: TextStyle(
                color: value != null ? Colors.black87 : Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
