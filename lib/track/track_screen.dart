import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courier/GlobalUtils/UI_Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key key, this.parcelId}) : super(key: key);
  final String parcelId;

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Parcel"),
        backgroundColor: UIColors.primaryColor,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('trackParcel')
              .where('parcelId', isEqualTo: widget.parcelId.toString())
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            log(snapshot.data.toString());
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data.docs.length == 0) {
              return Center(
                child: Text("Parcel Not Assigned Yet"),
              );
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    snapshot.data.docs[0]['lat'], snapshot.data.docs[0]['lon']),
                zoom: 14,
              ),
              markers: Set<Marker>.of(<Marker>[
                Marker(
                  markerId: MarkerId("value"),
                  position: LatLng(
                    snapshot.data.docs[0]['lat'],
                    snapshot.data.docs[0]['lon'],
                  ),
                )
              ]),
            );
          }),
    );
  }
}
