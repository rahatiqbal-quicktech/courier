// import 'dart:developer';

// import 'package:courier/Merchant/Dashboard/Dashboard.dart';
// import 'package:courier/Merchant/topup/model/topup_history_model.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;

// class TopupService {
//   Future<List<TopupHistoryModel>> getData() async {
//     var box = GetStorage();
//     String url =
//         "https://zidrop.com/api/merchant/topup-history/${box.read("userId")}";

//     var uri = Uri.parse(url);

//     var response = await http.get(uri);
//     log(response.body);

//     if (response.statusCode == 200) {
//       return topupHistoryModelFromJson(response.body);
//     } else {
//       return null;
//     }
//   }

//   storePayment(
//       {String email,
//       String amount,
//       String reference,
//       String status,
//       String channel,
//       String currency,
//       String mobile,
//       CheckoutResponse response}) async {
//     var box = GetStorage();
//     var data = {
//       "merchant_id": box.read("userId").toString(),
//       "email": email,
//       "amount": amount,
//       "reference": reference,
//       "status": status,
//       "channel": channel,
//       "currency": currency,
//       "mobile": mobile
//     };
//     log(data.toString());

//     String url = "https://zidrop.com/api/merchant/store-payment";
//     var uri = Uri.parse(url);

//     var httpResponse = await http.post(uri, body: data);
//     log(httpResponse.toString());

//     if (httpResponse.statusCode == 200) {
//       Get.snackbar("Confirmed", "Your payment has confirmed");
//       Get.off(() => QuickTechIT_Dashboard());
//     }
//   }
// }
