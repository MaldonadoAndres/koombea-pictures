import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

String getOrdinalDate(String timestamp) {
  final formatter = DateFormat('EEE MMM d yyyy HH:mm:ss');
  final date = formatter.parse(timestamp);
  return Jiffy([date.year, date.month, date.day]).format("MMM do yyyy");
}
