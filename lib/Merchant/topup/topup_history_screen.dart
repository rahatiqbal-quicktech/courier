// import 'package:courier/GlobalUtils/UI_Colors.dart';
// import 'package:courier/Merchant/topup/model/topup_history_model.dart';
// import 'package:courier/Merchant/topup/service/topup_service.dart';
// import 'package:flutter/material.dart';

// class TopupHistoryScreen extends StatefulWidget {
//   const TopupHistoryScreen({Key key}) : super(key: key);

//   @override
//   State<TopupHistoryScreen> createState() => TopupHistoryScreenState();
// }

// class TopupHistoryScreenState extends State<TopupHistoryScreen> {
//   @override
//   void initState() {
//     super.initState();
//     TopupService().getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20),
//             ),
//           ),
//           elevation: 0,
//           backgroundColor: UIColors.primaryColor,
//           iconTheme: const IconThemeData(color: Colors.white),
//           automaticallyImplyLeading: false,
//           title: Text("Topups"),
//         ),
//         body: FutureBuilder<List<TopupHistoryModel>>(
//             future: TopupService().getData(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: snapshot.data.length ?? 0,
//                     itemBuilder: (context, index) {
//                       var data = snapshot.data[index];
//                       return Container(
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: UIColors.bottleGreenColor.withOpacity(0.4),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ListTile(
//                                 title: Text(
//                                     "${data.createdAt.day}-${data.createdAt.month}-${data.createdAt.year}"),
//                                 subtitle: Text(data.email),
//                                 trailing: Text(data.status),
//                                 contentPadding: EdgeInsets.zero,
//                               ),
//                               Text("Amount : ${data.amount}"),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text("Channel : ${data.channel}"),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text("Reference : ${data.reference}"),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//               } else {
//                 return CircularProgressIndicator();
//               }
//             }));
//   }
// }
