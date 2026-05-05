import 'package:timeago/timeago.dart' as timeago;

class CustomedTimeAgo {
  static String formatLastEntry(DateTime? date) {
    if (date == null) return "No entries yet";

    return timeago.format(date);
  }
}
