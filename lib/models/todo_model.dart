class TodoModel {
  int? id;
  String eventName;
  String eventDescription;
  String eventLocation;
  int priorityTaskColor;
  int prioritySecondColor;
  String eventTime;

  TodoModel({
    this.id,
    required this.eventName,
    required this.eventDescription,
    required this.priorityTaskColor,
    required this.prioritySecondColor,
    required this.eventTime,
    required this.eventLocation,
  });

  factory TodoModel.fromSqfliteDatabase(Map<String, dynamic> map) => TodoModel(
        id: map['id'] ?? 0,
        eventName: map['eventName'] ?? '',
        eventDescription: map['eventDescription'] ?? '',
        eventLocation: map['eventLocation'] ?? '',
        priorityTaskColor: map['priorityTaskColor'] ?? 0,
        prioritySecondColor: map['prioritySecondColor'] ?? 0,
        eventTime: map['eventTime'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'eventName': eventName,
        'eventDescription': eventDescription,
        'eventLocation': eventLocation,
        'priorityTaskColor': priorityTaskColor,
        'prioritySecondColor': prioritySecondColor,
        'eventTime': eventTime,
      };
}
