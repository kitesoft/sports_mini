class League {
  String id;
  String name;
  Map feed;
  // Constructor
  League({this.id, this.name, this.feed});
  League.fromJson(Map json) {
    this.id = json["id"];
    this.name = json["name"];
    this.feed = json["feed"];
  }
}
