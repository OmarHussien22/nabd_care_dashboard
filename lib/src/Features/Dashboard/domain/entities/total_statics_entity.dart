class TotalStaticsEntity { 
  final double count;
  final double prcentage;


  const TotalStaticsEntity({
    required this.count,
    required this.prcentage,
  });

  factory TotalStaticsEntity.fromJson(Map<String, dynamic> json) {
    return TotalStaticsEntity(
      count: json['count']??0.0,
      prcentage: json['prcentage']??0.0,
    );
  }  
}