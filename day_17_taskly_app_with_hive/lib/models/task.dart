class Task {
  String title;
  DateTime time;
  bool isDone;

  Task({required this.title, required this.time, required this.isDone});

  // the factory constructor creates a Task object from a Map
  // we need it to convert data from JSON, Hive boxes, or Firebase into an object or retrieving data from databases or APIs
  factory Task.fromMap(Map task) {
    return Task(
      title: task['title'],
      time: task['time'],
      isDone: task['isDone'],
    );
  }

  Map toMap() {
    return {'title': title, 'time': time, 'isDone': isDone};
  }
}
