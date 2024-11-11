class ProductRating {
  dynamic rate;
  int count;
  ProductRating({required this.rate, required this.count});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory ProductRating.fromMap(Map<String, dynamic> json) {
    return ProductRating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
