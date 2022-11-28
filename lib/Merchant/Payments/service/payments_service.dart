import 'package:courier/Merchant/Payments/models/payments_details_model.dart';
import 'package:courier/Merchant/Payments/models/payments_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PaymentsService {
  Future<List<PaymentsModel>> getPayments() async {
    var box = GetStorage();

    var response = await http.get(
      Uri.parse(
          "https://zidrop.com/api/merchant/payments/${box.read("userId")}"),
    );
    if (response.statusCode == 200) {
      return paymentsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future<List<PaymentsDetailsModel>> getPaymentDetails(String postData) async {
    String url = "https://zidrop.com/api/merchant/parcel/payments";
    var uri = Uri.parse(url);

    var data = {"update": postData};
    var response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      return paymentsDetailsModelFromJson(response.body);
    }
  }
}
