class AdoptableAnimal {
  String id;
  String name;
  String type;
  String breed;
  String age;
  String address;
  String owner_name;
  String owner_no;
  String image;

  AdoptableAnimal(this.id, this.name, this.type, this.breed, this.age,
      this.address, this.owner_name, this.owner_no, this.image);

  factory AdoptableAnimal.fromJson(dynamic json) {
    return AdoptableAnimal(
      "${json['id']}",
      "${json['name']}",
      "${json['type']}",
      "${json['breed']}",
      "${json['age']}",
      "${json['address']}",
      "${json['owner_name']}",
      "${json['owner_no']}",
      "${json['image']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'breed': breed,
        'age': age,
        'address': address,
        'owner_name': owner_name,
        'owner_no': owner_no,
        'image': image
      };
}
