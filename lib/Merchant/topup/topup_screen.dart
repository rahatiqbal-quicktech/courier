// import 'dart:math';

// import 'package:courier/GlobalUtils/Decoration.dart';
// import 'package:courier/GlobalUtils/UI_Colors.dart';
// import 'package:courier/Merchant/topup/service/topup_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';

// class TopupScreen extends StatefulWidget {
//   const TopupScreen({Key key}) : super(key: key);

//   @override
//   State<TopupScreen> createState() => _TopupScreenState();
// }

// class _TopupScreenState extends State<TopupScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController topupAmountController = TextEditingController();

//   // var publicKey = 'pk_test_d762fac7bdd8d0d03f9575dd6e579b45ff8b1c49';
//   var publicKey = 'pk_live_a0b1cc8fdd4c9e71e02cafbdb3b0bca575dd92fe';

//   final plugin = PaystackPlugin();

//   final _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//     plugin.initialize(publicKey: publicKey);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: UIColors.primaryColor,
//         iconTheme: const IconThemeData(color: Colors.white),
//         automaticallyImplyLeading: false,
//         title: Text("Topups"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           children: [
//             SizedBox(
//               height: 50,
//             ),
//             Container(
//               decoration: CustomDecoration().textFieldDecoration(),
//               child: TextField(
//                 controller: mobileController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Mobile Number',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: CustomDecoration().textFieldDecoration(),
//               child: TextField(
//                 controller: topupAmountController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Topup Amount',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               decoration: CustomDecoration().textFieldDecoration(),
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'E mail',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 var ref = 'Zi_' +
//                     (Random().nextDouble() * 9999).toInt().toString() +
//                     '_' +
//                     (Random().nextDouble() * 99999999).toInt().toString() +
//                     '_' +
//                     (Random().nextDouble() * 99999).toInt().toString();
//                 debugPrint(ref);
//                 Charge charge = Charge()
//                   ..amount = int.parse(topupAmountController.text) * 100
//                   ..reference = ref
//                   ..email = emailController.text
//                   ..currency = "NGN";
//                 //  ..accessCode = publicKey
//                 CheckoutResponse response = await plugin.checkout(
//                   context,
//                   method: CheckoutMethod
//                       .card, // Defaults to CheckoutMethod.selectable
//                   charge: charge,
//                   fullscreen: true,
//                 );
//                 debugPrint(response.toString());

//                 if (response.status == true) {
//                   debugPrint("data");
//                   TopupService().storePayment(
//                     email: emailController.text,
//                     amount: topupAmountController.text,
//                     // channel: response.method.name,
//                     channel: "Card",
//                     currency: "NGN",
//                     mobile: mobileController.text,
//                     reference: response.reference,
//                     response: CheckoutResponse.defaults(),
//                     status: response.status.toString(),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: UIColors.primaryColor,
//               ),
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
