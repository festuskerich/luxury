class Adverts {
  int? id;
  String? title;
  String? bodyContent;
  String? image;

  Adverts({this.id, this.title, this.bodyContent, this.image});

  Adverts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bodyContent = json['bodyContent'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['bodyContent'] = bodyContent;
    data['image'] = image;

    return data;
  }
}
