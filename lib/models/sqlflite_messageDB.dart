class MessageM {
  int _idM;
  int _priorityM;
  String _topicsM;
  String _scriptureM;
  String _messageM;
  String _dateM;

  MessageM(
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

  set messageM(String newMessageM) {
    if (newMessageM.length <= 255) {
      this._messageM = newMessageM;
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
    var mapM = Map<String, dynamic>();
    if (idM != null) {
      mapM["idM"] = _idM;
    }

    mapM["topicM"] = _topicsM;
    mapM["scriptureM"] = _scriptureM;
    mapM["messageM"] = _messageM;
    mapM["priorityM"] = _priorityM;
    mapM["dateM"] = _dateM;
    return mapM;
  }

  MessageM.fromMapObject(Map<String, dynamic> mapM) {
    this._idM = mapM["idM"];

    this._topicsM = mapM["topicM"];
    this._scriptureM = mapM["scriptureM"];
    this._messageM = mapM["messageM"];
    this._priorityM = mapM["priorityM"];
    this._dateM = mapM["dateM"];
  }
}
