import 'package:flutter/material.dart';

class Contact {
  String name;
  String contact;
  String? imagePath;

  Contact({required this.name, required this.contact, this.imagePath});

  get image => null;
}
