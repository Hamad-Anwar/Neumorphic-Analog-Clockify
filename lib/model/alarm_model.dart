class AlarmModel {
  String? key;
  String? hour;
  String? min;
  String? period;
  String? title;
  String? day;
  String? isEnabled;
  String? alarmId;

  AlarmModel(
      {required this.key,
      required this.hour,
      required this.period,
      required this.min,
      required this.day,
      required this.isEnabled,
        required this.alarmId,
      required this.title});

  AlarmModel.fromMap(Map<String, dynamic> map) {
    key=map['key'];
    hour = map['hour'];
    min = map['min'];
    period = map['period'];
    title = map['title'];
    day = map['day'];
    isEnabled = map['isEnabled'];
    alarmId=map['alarmId'];
  }

  Map<String, Object?> toMap() {
    return {
      'key' : key,
      'hour': hour,
      'min': min,
      'period': period,
      'title': title,
      'day': day,
      'isEnabled': isEnabled,
      'alarmId' : alarmId
    };
  }
}
