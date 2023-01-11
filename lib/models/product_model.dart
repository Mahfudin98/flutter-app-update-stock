class ProductModel {
  String code;
  String image;
  String productName;
  String categoryName;
  String categoryPay;
  String agen;
  String reseller;
  String endUser;
  String stock;
  String time;

  ProductModel({
    required this.code,
    required this.image,
    required this.productName,
    required this.categoryName,
    required this.categoryPay,
    required this.agen,
    required this.reseller,
    required this.endUser,
    required this.stock,
    required this.time,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        code: json['code_produk'],
        image: json['image'],
        productName: json['nama_produk'],
        categoryName: json['category_name'],
        categoryPay: json['category_pay'],
        agen: json['harga_agen'],
        reseller: json['harga_reseller'],
        endUser: json['harga_end_user'],
        stock: json['stock'],
        time: json['time'],
      );
}
