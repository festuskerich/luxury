import 'package:theluxuryshoplaravelbackend/generated/json/base/json_convert_content.dart';
import 'package:theluxuryshoplaravelbackend/screens/models/material_images_entity.dart';

MaterialImagesEntity $MaterialImagesEntityFromJson(Map<String, dynamic> json) {
	final MaterialImagesEntity materialImagesEntity = MaterialImagesEntity();
	final double? id = jsonConvert.convert<double>(json['id']);
	if (id != null) {
		materialImagesEntity.id = id;
	}
	final String? materialName = jsonConvert.convert<String>(json['material_name']);
	if (materialName != null) {
		materialImagesEntity.materialName = materialName;
	}
	final String? materialCategory = jsonConvert.convert<String>(json['material_category']);
	if (materialCategory != null) {
		materialImagesEntity.materialCategory = materialCategory;
	}
	final String? materialImage = jsonConvert.convert<String>(json['material_image']);
	if (materialImage != null) {
		materialImagesEntity.materialImage = materialImage;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		materialImagesEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		materialImagesEntity.updatedAt = updatedAt;
	}
	return materialImagesEntity;
}

Map<String, dynamic> $MaterialImagesEntityToJson(MaterialImagesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['material_name'] = entity.materialName;
	data['material_category'] = entity.materialCategory;
	data['material_image'] = entity.materialImage;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	return data;
}