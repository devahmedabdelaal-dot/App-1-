class Categoriesmodel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDataTime;

  Categoriesmodel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDataTime});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['Categories_id'];
    categoriesName = json['Categories_name'];
    categoriesNameAr = json['Categories_name_ar'];
    categoriesImage = json['Categories_image'];
    categoriesDataTime = json['Categories_data_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Categories_id'] = this.categoriesId;
    data['Categories_name'] = this.categoriesName;
    data['Categories_name_ar'] = this.categoriesNameAr;
    data['Categories_image'] = this.categoriesImage;
    data['Categories_data_time'] = this.categoriesDataTime;
    return data;
  }
}