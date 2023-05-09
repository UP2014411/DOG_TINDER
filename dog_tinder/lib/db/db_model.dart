class DBModel {
  final int? id;
  final String dogName;
  final String dogBreed;
  final int dogAge;
  final String dogBio;

  const DBModel(
      {this.id,
      required this.dogName,
      required this.dogBreed,
      required this.dogAge,
      required this.dogBio});

  factory DBModel.fromDB(Map<String, dynamic> json) => DBModel(
      id: json['id'],
      dogName: json['dogName'],
      dogBreed: json['dogBreed'],
      dogAge: json['dogAge'],
      dogBio: json['dogBio']);

  Map<String, dynamic> toDB() => {
        'id': id,
        'dogName': dogName,
        'dogBreed': dogBreed,
        'dogAge': dogAge,
        'dogBio': dogBio
      };
}
