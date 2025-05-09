import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

/// Utility functions for string manipulation and validation
class StringUtils {
  /// Capitalize first letter of a string
  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Capitalize each word in a string
  static String capitalizeEachWord(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => capitalizeFirst(word)).join(' ');
  }

  /// Convert string to title case
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    
    final List<String> nonCapitalized = [
      'a', 'an', 'the', 'and', 'but', 'or', 'for', 'nor', 
      'on', 'at', 'to', 'from', 'by', 'in', 'of', 'with'
    ];
    
    final words = text.toLowerCase().split(' ');
    
    // Always capitalize first and last word
    for (int i = 0; i < words.length; i++) {
      if (i == 0 || i == words.length - 1 || !nonCapitalized.contains(words[i])) {
        words[i] = capitalizeFirst(words[i]);
      }
    }
    
    return words.join(' ');
  }

  /// Truncate string to a specified length
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - suffix.length) + suffix;
  }

  /// Format price with currency
  static String formatPrice(double price, {String currency = 'BDT', bool showDecimal = false}) {
    final formatter = NumberFormat.currency(
      symbol: getCurrencySymbol(currency),
      decimalDigits: showDecimal ? 2 : 0,
    );
    return formatter.format(price);
  }

  /// Format date from DateTime
  static String formatDate(DateTime date, {String format = 'dd-MM-yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Format timestamp to relative time (e.g., "2 hours ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays >= 7) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }

  /// Get currency symbol based on currency code
  static String getCurrencySymbol(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'BDT': return '৳';
      case 'USD': return '\$';
      case 'EUR': return '€';
      case 'GBP': return '£';
      case 'INR': return '₹';
      default: return currencyCode;
    }
  }

  /// Check if string is valid email
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  /// Check if string is valid phone number (Bangladesh format)
  static bool isValidBdPhoneNumber(String phone) {
    // Bangladesh phone numbers are 11 digits and usually start with 01
    final phoneRegex = RegExp(r'^01[3-9][0-9]{8}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Check if string is valid URL
  static bool isValidUrl(String url) {
    final urlRegex = RegExp(
      r'^(http|https)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$',
      caseSensitive: false,
    );
    return urlRegex.hasMatch(url);
  }

  /// Convert string to slug format (for URLs)
  static String toSlug(String text) {
    String result = text.toLowerCase().trim();
    
    // Replace non-alphanumeric characters with hyphens
    result = result.replaceAll(RegExp(r'[^\w\s-]'), '');
    result = result.replaceAll(RegExp(r'[\s_-]+'), '-');
    result = result.replaceAll(RegExp(r'^-+|-+$'), '');
    
    return result;
  }

  /// Generate a excerpt from HTML content
  static String htmlToPlainText(String htmlContent, {int maxLength = 100}) {
    // Simple HTML tag removal - for complex HTML, consider using a proper HTML parser
    String plainText = htmlContent
        .replaceAll(RegExp(r'<[^>]*>'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    
    return truncate(plainText, maxLength);
  }

  /// Mask sensitive information (e.g., phone number, email)
  static String maskSensitiveInfo(String text, {String mask = '*'}) {
    if (text.isEmpty) return text;
    
    if (isValidEmail(text)) {
      // Mask email: a****@example.com
      final parts = text.split('@');
      if (parts.length == 2) {
        final name = parts[0];
        final domain = parts[1];
        final maskedName = name.length > 1 
            ? name[0] + mask * (name.length - 1) 
            : name;
        return '$maskedName@$domain';
      }
    } else if (text.length > 4) {
      // General purpose masking, show first and last 2 chars
      return text.substring(0, 2) + 
          mask * (text.length - 4) + 
          text.substring(text.length - 2);
    }
    
    return text;
  }
}