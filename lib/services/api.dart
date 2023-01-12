const String link = "https://api-report.lsskincare.id/api/";

class ApiNetwork {
  final String imageURL = "https://api-report.lsskincare.id//storage/user/";
  var login = Uri.parse('${link}login');
  var userLogin = Uri.parse('${link}user-login');
  var userImage = Uri.parse('${link}user-image');
  var listProduk = Uri.parse('${link}product-list-gudang');
}
