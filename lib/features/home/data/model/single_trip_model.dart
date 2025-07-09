class SingleTripModel {
  int? id;
  String? fromArea;
  String? toArea;
  String? timeOfTravel;
  String? timeOfReach;
  String? duration;
  String? price;
  String? date;
  String? driverName;
  int? tripNumber;

  SingleTripModel(
      {this.id,
        this.fromArea,
        this.toArea,
        this.timeOfTravel,
        this.timeOfReach,
        this.duration,
        this.price,
        this.date,
        this.driverName,
        this.tripNumber});

  SingleTripModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromArea = json['from_area'];
    toArea = json['to_area'];
    timeOfTravel = json['time_of_travel'];
    timeOfReach = json['time_of_reach'];
    duration = json['duration'];
    price = json['price'];
    date = json['date'];
    driverName = json['driver_name'];
    tripNumber = json['trip_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_area'] = this.fromArea;
    data['to_area'] = this.toArea;
    data['time_of_travel'] = this.timeOfTravel;
    data['time_of_reach'] = this.timeOfReach;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['date'] = this.date;
    data['driver_name'] = this.driverName;
    data['trip_number'] = this.tripNumber;
    return data;
  }
}
