import 'package:flutter/material.dart';
import 'package:techno_app/constants/assets.dart';

import 'details/food_details.dart';

class FoodMain extends StatelessWidget {
  const FoodMain({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    iconSize: 40,
                  ),
                  Image.asset(
                    Assets.techlogo,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_outlined),
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 2.0,
              color: Colors.grey,
              width: 370,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  Assets.techfood5,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sour Pork',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(Assets.star3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(Assets.star3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(Assets.star3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(Assets.star3),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SizedBox(
                              width: 26,
                              height: 26,
                              child: Image.asset(Assets.star3),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'P120.000',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '10k Solds',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food Description',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30, top: 8),
                        child: Text(
                          'Pork Sinigang, commonly known as "Sinigang na Baboy" in the Philippines, is a traditional and beloved Filipino dish that showcases the countrys unique palate for sour flavors. This savory and tangy soup is renowned for its comforting and hearty qualities, making it a staple in Filipino households and a favorite among many.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Feedback',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: commentlist.length,
                    itemBuilder: (context, index) {
                      final comment = commentlist[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(comment.imagePath),
                              radius: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comment.comment ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (comment.like != null &&
                                                comment.like!.isNotEmpty)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Image.asset(
                                                  comment.like!,
                                                  width: 24,
                                                  height: 24,
                                                ),
                                              ),
                                            if (comment.dislike != null &&
                                                comment.dislike!.isNotEmpty)
                                              Image.asset(
                                                comment.dislike!,
                                                width: 24,
                                                height: 24,
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(Assets.pfp),
                        radius: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 71,
                          width: 310,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Write you’re feedback...',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 68,
                    width: 358,
                    decoration: BoxDecoration(
                      color: const Color(0xFF212121),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                            'P120.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFAD681A),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text(
                              'Order',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
