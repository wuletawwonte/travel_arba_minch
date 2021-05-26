class Destination {
  String name;
  String description;
  String imageurl;

  Destination(this.name, this.description, this.imageurl);

  factory Destination.fromJSON(Map<String, dynamic> json) {
    return Destination(json['name'], json['description'], json['imageurl']);
  }
}
