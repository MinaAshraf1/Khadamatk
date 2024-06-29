String convertDateToHours(String dateString) {
  DateTime date = DateTime.parse(dateString);

  int hour = date.hour;

  int minutes = date.minute;

  if(hour == 0) {
    if(minutes == 0) {
      return "00 : 12 ص";
    }
    return "${minutes} : 12 ص";
  } else if (hour > 12) {
    return "$minutes : ${hour - 12} م";
  } else {
    return "$minutes : $hour ص";
  }
}

String firstName(String text) {
  String word = text.substring(0, text.indexOf(" "));
  return '$word ';
}

lastName(String text) {
  List<String> words = text.split(' ');

  List<String> desiredWords = words.sublist(1, words.length);

  return desiredWords.join(' ');
}