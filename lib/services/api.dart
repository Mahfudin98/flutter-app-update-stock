const String link = "https://api-report.lsskincare.id/api/";

class ApiNetwork {
  final String imageLogo =
      "https://lh3.googleusercontent.com/d/1BB-FX1SOgpmn_qqU9gyoFi0iGqayzk6b?authuser=0";
  final String imageURL = "https://api-report.lsskincare.id//storage/user/";
  var login = Uri.parse('${link}login');
  var userLogin = Uri.parse('${link}user-login');
  var userImage = Uri.parse('${link}user-image');
  var listProduk = Uri.parse('${link}product-list-gudang');
  var updateStockLink = '${link}product-stock-update/';
  var listLogistic = Uri.parse('${link}index-logistic');
  var updateStockLogistic = '${link}update-logistic/';
}
