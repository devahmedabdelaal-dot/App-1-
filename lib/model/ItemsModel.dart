class itemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsPriceDiscount;
  int? itemsDiscount;
  String? itemsDataTime;
  int? itemCategories;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDataTime;
  int? favorite;
  

  itemsModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsPriceDiscount,
      this.itemsDiscount,
      this.itemsDataTime,
      this.itemCategories,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDataTime,
      this.favorite});

  itemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['Items_id'];
    itemsName = json['Items_name'];
    itemsNameAr = json['Items_name_ar'];
    itemsDesc = json['Items_desc'];
    itemsDescAr = json['Items_desc_ar'];
    itemsImage = json['Items_image'];
    itemsCount = json['Items_count'];
    itemsActive = json['Items_active'];
    itemsPrice = json['Items_price'];
    itemsPriceDiscount = json['Items_priceDiscount'];
    itemsDiscount = json['Items_discount'];
    itemsDataTime = json['Items_data_time'];
    itemCategories = json['item_categories'];
    categoriesId = json['Categories_id'];
    categoriesName = json['Categories_name'];
    categoriesNameAr = json['Categories_name_ar'];
    categoriesImage = json['Categories_image'];
    categoriesDataTime = json['Categories_data_time'];
     favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Items_id'] = this.itemsId;
    data['Items_name'] = this.itemsName;
    data['Items_name_ar'] = this.itemsNameAr;
    data['Items_desc'] = this.itemsDesc;
    data['Items_desc_ar'] = this.itemsDescAr;
    data['Items_image'] = this.itemsImage;
    data['Items_count'] = this.itemsCount;
    data['Items_active'] = this.itemsActive;
    data['Items_price'] = this.itemsPrice;
    data['Items_priceDiscount'] = this.itemsPriceDiscount;
    data['Items_discount'] = this.itemsDiscount;
    data['Items_data_time'] = this.itemsDataTime;
    data['item_categories'] = this.itemCategories;
    data['Categories_id'] = this.categoriesId;
    data['Categories_name'] = this.categoriesName;
    data['Categories_name_ar'] = this.categoriesNameAr;
    data['Categories_image'] = this.categoriesImage;
    data['Categories_data_time'] = this.categoriesDataTime;
    data['favorite'] = this.favorite;
    return data;
  }
}