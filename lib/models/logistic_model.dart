// ignore_for_file: non_constant_identifier_names

class LogisticModel {
  String id;
  String nama_barang;
  String category_name;
  String stock_logistic;
  String satuan;
  // String keterangan;

  LogisticModel({
    required this.id,
    required this.nama_barang,
    required this.category_name,
    required this.stock_logistic,
    required this.satuan,
    // required this.keterangan,
  });

  factory LogisticModel.formJson(Map<String, dynamic> json) => LogisticModel(
        id: json["id"],
        nama_barang: json["nama_barang"],
        category_name: json["category_name"],
        stock_logistic: json["stock_logistic"],
        satuan: json["satuan"],
        // keterangan: json["keterangan"],
      );
}
