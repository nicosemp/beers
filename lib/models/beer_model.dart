class Beer {
  final String? imageUrl;
  final String? name;
  final String? description;
  final double? abv;
  final double? ibu;
  final String? firstBrewed;
  final List<dynamic>? foodPairing;
  final String? brewersTips;

  Beer({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.abv,
    required this.ibu,
    required this.firstBrewed,
    required this.foodPairing,
    required this.brewersTips,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      imageUrl: json['image_url'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      abv: json['abv']?.toDouble(),
      ibu: json['ibu']?.toDouble(),
      firstBrewed: json['first_brewed'] as String,
      foodPairing: json['food_pairing'] as List<dynamic>,
      brewersTips: json['brewers_tips'] as String,
    );
  }
}
