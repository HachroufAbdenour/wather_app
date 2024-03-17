
class Cloudiness {
  final int? percentage;

  Cloudiness({
    required this.percentage,
  });

  factory Cloudiness.fromJson(Map<String, dynamic> json) {
    return Cloudiness(
      percentage: json['clouds']['all'],
    );
  }
}

