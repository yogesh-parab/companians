class Rescue {
  String id;
  String name;
  String mobile;
  String address;
  String image;

  Rescue(
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.image,
  );

  factory Rescue.fromJson(dynamic json) {
    return Rescue(
      "${json['id']}",
      "${json['name']}",
      "${json['mobile']}",
      "${json['address']}",
      "${json['image']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'address': address,
        'image': image,
      };
}
