// ignore_for_file: file_names, unnecessary_getters_setters

class MerchantDashboardModel {
  int _placeParcel;
  int _pendingParcel;
  int _deliveredParcel;
  int _cancelParcel;
  int _collectAmount;
  int _totalPaid;
  int _parcelReturn;
  int _totalHold;
  int _totalAmount;
  int _merchantUnpaid;
  int _merchantPaid;
  int _inTransitParcel;

  MerchantDashboardModel(
      {int placeParcel,
      int pendingParcel,
      int deliveredParcel,
      int cancelParcel,
      int collectAmount,
      int totalPaid,
      int parcelReturn,
      int totalHold,
      int totalAmount,
      int merchantUnpaid,
      int merchantPaid,
      int inTransitParcel}) {
    _placeParcel = placeParcel;
    _pendingParcel = pendingParcel;
    _deliveredParcel = deliveredParcel;
    _cancelParcel = cancelParcel;
    _collectAmount = collectAmount;
    _totalPaid = totalPaid;
    _parcelReturn = parcelReturn;
    _totalHold = totalHold;
    _totalAmount = totalAmount;
    _merchantUnpaid = merchantUnpaid;
    _merchantPaid = merchantPaid;
    _inTransitParcel = inTransitParcel;
  }

  int get placeParcel => _placeParcel;
  set placeParcel(int placeParcel) => _placeParcel = placeParcel;
  int get pendingParcel => _pendingParcel;
  set pendingParcel(int pendingParcel) => _pendingParcel = pendingParcel;
  int get deliveredParcel => _deliveredParcel;
  set deliveredParcel(int deliveredParcel) =>
      _deliveredParcel = deliveredParcel;
  int get cancelParcel => _cancelParcel;
  set cancelParcel(int cancelParcel) => _cancelParcel = cancelParcel;
  int get collectAmount => _collectAmount;
  set collectAmount(int collectAmount) => _collectAmount = collectAmount;
  int get totalPaid => _totalPaid;
  set totalPaid(int totalPaid) => _totalPaid = totalPaid;
  int get parcelReturn => _parcelReturn;
  set parcelReturn(int parcelReturn) => _parcelReturn = parcelReturn;
  int get totalHold => _totalHold;
  set totalHold(int totalHold) => _totalHold = totalHold;
  int get totalAmount => _totalAmount;
  set totalAmount(int totalAmount) => _totalAmount = totalAmount;
  int get merchantUnpaid => _merchantUnpaid;
  set merchantUnpaid(int merchantUnpaid) => _merchantUnpaid = merchantUnpaid;
  int get merchantPaid => _merchantPaid;
  set merchantPaid(int merchantPaid) => _merchantPaid = merchantPaid;
  int get inTransitParcel => _inTransitParcel;
  set inTransitParcel(int inTransitParcel) =>
      _inTransitParcel = inTransitParcel;

  MerchantDashboardModel.fromJson(Map<String, dynamic> json) {
    _placeParcel = json['placeParcel'];
    _pendingParcel = json['pendingParcel'];
    _deliveredParcel = json['deliveredParcel'];
    _cancelParcel = json['cancelParcel'];
    _collectAmount = json['collectAmount'];
    _totalPaid = json['totalPaid'];
    _parcelReturn = json['parcelReturn'];
    _totalHold = json['totalHold'];
    _totalAmount = json['totalAmount'];
    _merchantUnpaid = json['merchantUnpaid'];
    _merchantPaid = json['merchantPaid'];
    _inTransitParcel = json['inTransitParcel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['placeParcel'] = _placeParcel;
    data['pendingParcel'] = _pendingParcel;
    data['deliveredParcel'] = _deliveredParcel;
    data['cancelParcel'] = _cancelParcel;
    data['collectAmount'] = _collectAmount;
    data['totalPaid'] = _totalPaid;
    data['parcelReturn'] = _parcelReturn;
    data['totalHold'] = _totalHold;
    data['totalAmount'] = _totalAmount;
    data['merchantUnpaid'] = _merchantUnpaid;
    data['merchantPaid'] = _merchantPaid;
    data['inTransitParcel'] = _inTransitParcel;
    return data;
  }
}
