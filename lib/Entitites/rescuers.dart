import 'package:flutter/material.dart';

class Rescue {
  String id;
  String name;
  String mobile;
  String address;
  String image;
  String amount;
  String request;

  Rescue({
    @required this.id,
    @required this.name,
    @required this.mobile,
    @required this.address,
    @required this.image,
    @required this.amount,
    @required this.request,
  });

  factory Rescue.fromJson(dynamic json) {
    return Rescue(
      id:"${json['id']}",
      name:"${json['name']}",
      mobile:"${json['mobile']}",
      address:"${json['address']}",
      image:"${json['image']}",
      amount:"${json['amount']}",
      request:"${json['request']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'address': address,
        'image': image,
        'amount': amount,
        'request': request,
      };
}
