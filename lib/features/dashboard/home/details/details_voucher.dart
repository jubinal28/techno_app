import '../../../../constants/assets.dart';

class VoucherInfo {
  final String icon;
  final String dicount;

  VoucherInfo({
    required this.icon,
    required this.dicount,
  });
}

List<VoucherInfo> voucherhead = [
  VoucherInfo(icon: Assets.icFacebook, dicount: "30%"),
  VoucherInfo(icon: Assets.icFacebook, dicount: "20%"),
];
