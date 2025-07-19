class SeatsModel {
  int? tripId;
  List<int>? availableSeats;
  int? totalSeats;
  int? reservedCount;
  int? availableCount;

  SeatsModel(
      {this.tripId,
        this.availableSeats,
        this.totalSeats,
        this.reservedCount,
        this.availableCount});

  SeatsModel.fromJson(Map<String, dynamic> json) {
    tripId = json['trip_id'];
    availableSeats = json['available_seats'].cast<int>();
    totalSeats = json['total_seats'];
    reservedCount = json['reserved_count'];
    availableCount = json['available_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trip_id'] = this.tripId;
    data['available_seats'] = this.availableSeats;
    data['total_seats'] = this.totalSeats;
    data['reserved_count'] = this.reservedCount;
    data['available_count'] = this.availableCount;
    return data;
  }
}
