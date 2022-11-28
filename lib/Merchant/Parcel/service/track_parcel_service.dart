
import 'package:courier/Merchant/Parcel/model/track_parcel_model.dart';
import 'package:http/http.dart' as http;

class TrackParcelService {
  Future<ParcelTrackModel> getData(String trackId) async {
    var response = await http
        .get(Uri.parse("https://zidrop.com/api/parcel/track/$trackId"));
    // log(response.body.toString());

    if (response.statusCode == 200) {
      // var decode = jsonDecode(response.body);
      // var data = decode["data"][0]["notes"];
      // var data = decode["data"];
      // log(data.toString());

      return parcelTrackModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
