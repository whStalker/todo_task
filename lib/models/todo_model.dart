class TodoModel {
  int? id;
  String eventName;
  String eventDescription;
  String eventLocation;
  String priorityColor;
  String eventTime;

  TodoModel({
    this.id,
    required this.eventName,
    required this.eventDescription,
    required this.priorityColor,
    required this.eventTime,
    required this.eventLocation,
  });

  factory TodoModel.fromSqfliteDatabase(Map<String, dynamic> map) => TodoModel(
        id: map['id'] ?? 0,
        eventName: map['eventName'] ?? '',
        eventDescription: map['eventDescription'] ?? '',
        eventLocation: map['eventLocation'] ?? '',
        priorityColor: map['priorityColor'] ?? '',
        eventTime: map['eventTime'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'eventName': eventName,
        'eventDescription': eventDescription,
        'eventLocation': eventLocation,
        'priorityColor': priorityColor,
        'eventTime': eventTime,
      };
}
