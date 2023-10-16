class Package {
  final String id;
  final Map<String, PackageStatus> statuses;

  Package({
    required this.id,
    required this.statuses,
  });

  factory Package.fromJson(String id, Map<String, dynamic> json) {
    final Map<String, PackageStatus> statuses = {};
    json.forEach((key, value) {
      statuses[key] = PackageStatus.fromJson(key, value);
    });
    return Package(id: id, statuses: statuses);
  }

  bool get isEmpty {
    return statuses.isEmpty;
  }
}


class PackageStatus {
  final String status;
  final String city;
  final String time;

  PackageStatus({
    required this.status,
    required this.city,
    required this.time,
  });

  factory PackageStatus.fromJson(String status, Map<String, dynamic> json) {
    return PackageStatus(
      status: status,
      city: json['City'] ?? '',
      time: json['Time'] ?? '',
    );
  }

  @override
  String toString() {
    return 'PackageStatus(status: $status, City : $city, time: $time)';
  }
}
