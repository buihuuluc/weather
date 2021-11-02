import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart'; // for other locales

void main() {
  var now = DateTime.now();
  print(DateFormat().format(now)); // This will return date using the default locale
  print(DateFormat('hh:mm:ss yyyy-MM-dd').format(now));
  print(DateFormat.yMMMMd().format(now)); // print long date
  print(DateFormat.yMd().format(now)); // print short date
  print(DateFormat.jms().format(now)); // print time

  initializeDateFormatting('es'); // This will initialize Spanish locale
  print(DateFormat.yMMMMd('es').format(now)); // print long date in Spanish format
  print(DateFormat.yMd('es').format(now)); // print short date in Spanish format
  print(DateFormat.jms('es').format(now)); // print time in Spanish format
}