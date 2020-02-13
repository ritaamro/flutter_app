import 'list_item.dart';

class LogEntry implements ListItem {
  int logID;
  String type;
  String description;
  DateTime date;

  LogEntry.fromDAO(dynamic logEntry) {
    this.logID = logEntry["LogID"];
    this.type = logEntry["Type"];
    this.description = logEntry["LogMessage"];
    this.date = DateTime.parse(logEntry["CreatedAt"]);
  }
}
