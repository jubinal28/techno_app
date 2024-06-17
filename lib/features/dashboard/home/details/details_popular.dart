// ignore: camel_case_types
import '../../../../constants/assets.dart';

class Poplist {
  final String imagePath;
  final String food;
  final String price;
  final String star;
  final String sold;

  Poplist({
    required this.imagePath,
    required this.food,
    required this.price,
    required this.star,
    required this.sold,
  });
}

List<Poplist> poplist = [
  Poplist(
    imagePath: Assets.techfood1,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
  Poplist(
    imagePath: Assets.techfood2,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
  Poplist(
    imagePath: Assets.techfood3,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
  Poplist(
    imagePath: Assets.techfood4,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
  Poplist(
    imagePath: Assets.techfood5,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
  Poplist(
    imagePath: Assets.techfood6,
    food: 'Adobo',
    price: '₱120.000',
    star: 'asdf',
    sold: '5k Solds',
  ),
];
