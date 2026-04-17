class OrdersPendingModel {
  int? ordersId;
  int? ordersUsersid;
  String? ordersAddress;
  int? ordersType;
  int? ordersPrice;
  int? ordersTotalprice;
  int? ordersCouponDiscount;
  int? ordersPriceDelivery;
  int? ordersCoupon;
  String? ordersTime;
  int? ordersPaymentMethod;
  int? ordersStatus;

  OrdersPendingModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCouponDiscount,
      this.ordersPriceDelivery,
      this.ordersCoupon,
      this.ordersTime,
      this.ordersPaymentMethod,
      this.ordersStatus});

  OrdersPendingModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCouponDiscount = json['orders_coupon_discount'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersCoupon = json['orders_coupon'];
    ordersTime = json['orders_time'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon_discount'] = this.ordersCouponDiscount;
    data['orders_price_delivery'] = this.ordersPriceDelivery;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_time'] = this.ordersTime;
    data['orders_payment_method'] = this.ordersPaymentMethod;
    data['orders_status'] = this.ordersStatus;
    return data;
  }
}