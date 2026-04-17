class myFavoriteModel {
  int? favoriteId;
  int? favoriteUsersId;
  int? favoriteItemsId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDataTime;
  int? itemCategories;
  int? usersId;

  myFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersId,
      this.favoriteItemsId,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDataTime,
      this.itemCategories,
      this.usersId});

  myFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersId = json['favorite_users_id'];
    favoriteItemsId = json['favorite_items_id'];
    itemsId = json['Items_id'];
    itemsName = json['Items_name'];
    itemsNameAr = json['Items_name_ar'];
    itemsDesc = json['Items_desc'];
    itemsDescAr = json['Items_desc_ar'];
    itemsImage = json['Items_image'];
    itemsCount = json['Items_count'];
    itemsActive = json['Items_active'];
    itemsPrice = json['Items_price'];
    itemsDiscount = json['Items_discount'];
    itemsDataTime = json['Items_data_time'];
    itemCategories = json['item_categories'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_users_id'] = this.favoriteUsersId;
    data['favorite_items_id'] = this.favoriteItemsId;
    data['Items_id'] = this.itemsId;
    data['Items_name'] = this.itemsName;
    data['Items_name_ar'] = this.itemsNameAr;
    data['Items_desc'] = this.itemsDesc;
    data['Items_desc_ar'] = this.itemsDescAr;
    data['Items_image'] = this.itemsImage;
    data['Items_count'] = this.itemsCount;
    data['Items_active'] = this.itemsActive;
    data['Items_price'] = this.itemsPrice;
    data['Items_discount'] = this.itemsDiscount;
    data['Items_data_time'] = this.itemsDataTime;
    data['item_categories'] = this.itemCategories;
    data['users_id'] = this.usersId;
    return data;
  }
}