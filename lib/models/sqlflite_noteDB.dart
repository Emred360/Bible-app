class Note {
  int _id;
  String _minister;
  String _topic;
  String _scripture;
  String _message;
  String _date;
  int _priority;

  Note(
    this._date,
    this._message,
    this._priority,
    this._scripture,
    this._topic, [
    this._minister,
  ]);
  Note.withId(
    this._date,
    this._id,
    this._message,
    this._priority,
    this._scripture,
    this._topic, [
    this._minister,
  ]);
  int get id => _id;
  int get priority => _priority;
  String get message => _message;
  String get scripture => _scripture;
  String get date => _date;
  String get minister => _minister;
  String get topic => _topic;
//Setter
  set minister(String newMinister) {
    if (newMinister.length <= 255) {
      this._minister = newMinister;
    }
  }

  set topic(String newTopic) {
    if (newTopic.length <= 255) {
      this._message = newTopic;
    }
  }

  set scripture(String newScripture) {
    if (newScripture.length <= 255) {
      this._scripture = newScripture;
    }
  }

  set message(String newMessage) {
    if (newMessage.length <= 255) {
      this._message = newMessage;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._message = newDate;
  }

  //Convert
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = _id;
    }
    map["minister"] = _minister;
    map["topic"] = _topic;
    map["scripture"] = _scripture;
    map["message"] = _message;
    map["priority"] = _priority;
    map["date"] = _date;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map["id"];
    this._minister = map["minister"];
    this._topic = map["topic"];
    this._scripture = map["scripture"];
    this._message = map["message"];
    this._priority = map["priority"];
    this._date = map["date"];
  }
}