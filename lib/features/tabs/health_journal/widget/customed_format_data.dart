import 'package:intl/intl.dart';

class CustomedFormatData {
  static String formatNoteDate(DateTime? date) {
    if (date == null) return "";

    return DateFormat('EEEE, MMM d').format(date);
  }
}
