import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeConvert{
  static String toddmmmYYYY(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("dd MMM yyyy");
    return newFormat.format(DateTime.parse(dt));
  }
  static String toYYYYmmdd(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("yyyy-MM-dd");
    return newFormat.format(DateTime.parse(dt));
  }
  static String toddFullMonthYYYY(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("dd MMMM, yyyy");
    return newFormat.format(DateTime.parse(dt));
  }
  static String toddFullMonthYYYYWithAMPM(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("dd MMMM, yyyy").add_jm();
    return newFormat.format(DateTime.parse(dt));
  }
  static String toHHMMWithAMPM(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat('hh:mm a');
    return newFormat.format(DateTime.parse(dt));
  }static String toHHMMWithoutAMPM(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat().add_Hm();
    return newFormat.format(DateTime.parse(dt));
  }

  static String toddmmYYYY(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("dd-MM-yyyy");
    return newFormat.format(DateTime.parse(dt));
  }
  static String tommdd(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("MM-dd");
    return newFormat.format(DateTime.parse(dt));
  }

  static String stringTodate(String? dt){
    var a  = DateFormat("dd MMM yyyy").parse(dt!);
    return a.toString();
  }
  static String toYYYY(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("y");
    return newFormat.format(DateTime.parse(dt));
  }

  static String toddmmmm(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat("dd MMMM");
    return newFormat.format(DateTime.parse(dt));
  }

  static String toMonthName(String? dt) {
    if (dt == null || dt == "") return ' ';
    var newFormat = DateFormat('MMMM');
    return newFormat.format(DateTime.parse(dt));
  }

  static String timeAgoNotification(DateTime? dt) {
    if (dt == null || dt == "") return ' ';
    return timeago.format(dt);
  }

}