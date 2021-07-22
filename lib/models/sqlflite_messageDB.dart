class Message {
  int _idM;
  int _priorityM;
  String _topicsM;
  String _scriptureM;
  String _messageM;
  String _dateM;

  Message(
    this._priorityM,
    this._topicsM,
    this._scriptureM,
    this._messageM,
    this._dateM,
  );

  // Note.withId(
  //   this._date,
  //   this._idMM,
  //   this._message,
  //   this._priorityM,
  //   this._scripture,
  //   this.topics, [
  //   this._minister,
  // ]);
  int get idM => _idM;
  int get priorityM => _priorityM;
  String get messageM => _messageM;
  String get scriptureM => _scriptureM;
  String get dateM => _dateM;
  String get topicM => _topicsM;
//Setter

  set topicM(String newTopicM) {
    if (newTopicM.length <= 255) {
      this._topicsM = newTopicM;
    }
  }

  set scriptureM(String newScriptureM) {
    if (newScriptureM.length <= 255) {
      this._scriptureM = newScriptureM;
    }
  }

  set messageM(String newMessage) {
    if (newMessage.length <= 255) {
      this._messageM = newMessage;
    }
  }

  set priorityM(int newPriorityM) {
    if (newPriorityM >= 1 && newPriorityM <= 2) {
      this._priorityM = newPriorityM;
    }
  }

  set dateM(String newDateM) {
    this._dateM = newDateM;
  }

  //Convert
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (idM != null) {
      map["id"] = _idM;
    }

    map["topic"] = _topicsM;
    map["scripture"] = _scriptureM;
    map["message"] = _messageM;
    map["priority"] = _priorityM;
    map["date"] = _dateM;
    return map;
  }

  Message.fromMapObject(Map<String, dynamic> map) {
    this._idM = map["id"];

    this._topicsM = map["topic"];
    this._scriptureM = map["scripture"];
    this._messageM = map["message"];
    this._priorityM = map["priority"];
    this._dateM = map["date"];
  }
}
