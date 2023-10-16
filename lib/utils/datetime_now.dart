import 'package:intl/intl.dart';

String formattedDateTime() {
  final now = DateTime.now();
  final formatter = DateFormat('dd/MM/yyyy HH:mm');
  final formattedDate = formatter.format(now);
  return formattedDate;
}
