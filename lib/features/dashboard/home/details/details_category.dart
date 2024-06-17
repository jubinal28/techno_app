import '../../../../constants/assets.dart';

class CategoryInfo {
  final String icon;
  final String title;

  CategoryInfo({
    required this.icon,
    required this.title,
  });
}

List<CategoryInfo> categoryhead = [
  CategoryInfo(icon: Assets.techcategory, title: "Kapampangan"),
  CategoryInfo(icon: Assets.techcategory, title: "Tagalog"),
  CategoryInfo(icon: Assets.techcategory, title: "Ilocano"),
];
