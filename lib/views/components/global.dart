// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

class Global {
  static List view = [];
  static String? description;
  static String? Contact;
  static String? name;
}

class detail {
  final File? file;
  final String? name;
  final String? discription;

  detail({
    required this.file,
    required this.name,
    required this.discription,
  });
}

List<Map<String, dynamic>> details = [
  {
    'name': 'Tony Stark',
    'image': "platform_coverator/assets/images/iron-man-6480952_960_720.jpg",
    'number': '8238244102',
    'time': 'Yesterday,9:41 PM',
  },
  {
    'name': 'hulk',
    'image':
        "platform_coverator/assets/images/gettyimages-477211438-612x612.jpg",
    'number': '9824960767',
    'time': 'Yesterday,10:41 PM',
  },
  {
    'name': 'Thor',
    'image':
        "platform_coverator/assets/images/40747151783756ff94b39e018048d30e.jpg",
    'number': '9510570516',
    'time': 'April,6:30 PM',
  },
  {
    'name': 'Dr.Strange',
    'desc': 'it magic',
    'image':
        "platform_coverator/assets/images/p_drstrangeinthemultiverseofmadness_245_476cabb1.jpeg",
    'number': '8238244102',
    'time': 'March,5:48 PM',
  },
];
