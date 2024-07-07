class ModelKeepNotes {
  String? uId;
  String? title;
  String? description;
  String? email;

  ModelKeepNotes({this.title, this.description, this.uId, this.email});

  ModelKeepNotes.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    uId = json["uId"];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "uId": uId,
      'email': email
    };
  }
}
