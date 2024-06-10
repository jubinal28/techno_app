import 'package:flutter/material.dart';

import '../details/details_voucher.dart';

class HomeVouchers extends StatelessWidget {
  const HomeVouchers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 230, bottom: 6, top: 10),
          child: const Text(
            'Vouchers',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: voucherhead.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var vouinfo = voucherhead[index];
              return Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.yellow,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 53,
                                    height: 54,
                                    child: Image.asset(
                                      vouinfo.icon,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        vouinfo.dicount,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
