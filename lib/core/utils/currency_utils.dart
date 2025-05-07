import 'package:intl/intl.dart';

class CurrencyUtils {
  static final NumberFormat _currencyFormatter = NumberFormat.currency(
    symbol: '৳', // Bangladeshi Taka symbol
    decimalDigits: 0,
    locale: 'bn_BD',
  );

  static final NumberFormat _compactCurrencyFormatter = NumberFormat.compact(
    locale: 'bn_BD',
  );

  static String formatCurrency(num amount) {
    return _currencyFormatter.format(amount);
  }

  static String formatCompactCurrency(num amount) {
    return '৳${_compactCurrencyFormatter.format(amount)}';
  }

  static String formatCurrencyWithoutSymbol(num amount) {
    return _currencyFormatter.format(amount).replaceAll('৳', '').trim();
  }

  static num parseCurrency(String value) {
    try {
      final sanitized = value.replaceAll('৳', '').replaceAll(',', '').trim();
      return num.parse(sanitized);
    } catch (e) {
      return 0;
    }
  }

  static String calculateMonthlyRent(num amount) {
    return formatCurrency(amount);
  }

  static String calculateYearlyRent(num monthlyAmount) {
    return formatCurrency(monthlyAmount * 12);
  }

  static String calculateSecurityDeposit(
    num monthlyRent, [
    int multiplier = 2,
  ]) {
    return formatCurrency(monthlyRent * multiplier);
  }

  static bool isValidAmount(String value) {
    try {
      final amount = parseCurrency(value);
      return amount >= 0 && amount <= 999999999;
    } catch (e) {
      return false;
    }
  }

  static String getReadableAmount(num amount) {
    if (amount >= 10000000) {
      return '${(amount / 10000000).toStringAsFixed(1)} Cr';
    } else if (amount >= 100000) {
      return '${(amount / 100000).toStringAsFixed(1)} Lac';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(1)}K';
    }
    return amount.toString();
  }
}
