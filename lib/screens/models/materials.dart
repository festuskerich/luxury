class MaterialImages {
  int? id;
  String? material_name;
  String? material_category;
  String? material_image;

  MaterialImages(
      {this.id,
      this.material_name,
      this.material_category,
      this.material_image});

  MaterialImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    material_name = json['material_name'];
    material_category = json['material_category'];
    material_image = json['material_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['material_name'] = material_name;
    data['material_category'] = material_category;
    data['material_image'] = material_image;

    return data;
  }
}
