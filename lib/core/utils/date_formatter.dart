class DateFormatter {
  static String formatDate(String date) {
    return date;
  }

  static String formatRelative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays > 365) return 'منذ ${diff.inDays ~/ 365} سنة';
    if (diff.inDays > 30) return 'منذ ${diff.inDays ~/ 30} شهر';
    if (diff.inDays > 7) return 'منذ ${diff.inDays ~/ 7} أسبوع';
    if (diff.inDays > 0) return 'منذ ${diff.inDays} يوم';
    if (diff.inHours > 0) return 'منذ ${diff.inHours} ساعة';
    if (diff.inMinutes > 0) return 'منذ ${diff.inMinutes} دقيقة';
    return 'الآن';
  }
}
