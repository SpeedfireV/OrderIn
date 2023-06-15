import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../variables/colors.dart';

class CarouselItem extends ConsumerStatefulWidget {
  const CarouselItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarouselItemState();
}

class _CarouselItemState extends ConsumerState<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const Image(
                height: 260,
                image: AssetImage("lib/assets/images/vege-beef-burger.jpg"),
              ),
            ),
            Container(
              height: double.infinity,
              width: 220,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(left: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.mainColor.withOpacity(0.5),
                        AppColors.mainColor.withOpacity(0)
                      ])),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 140,
                    child: Text(
                      "Vege Beef Burger",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "\$8.99",
                    style: TextStyle(
                        color: AppColors.lightColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 23),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "5.0 (3.8k)",
                        style: TextStyle(
                            color: AppColors.lightColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            )),
                      ),
                      const SizedBox(width: 32),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline_rounded,
                          color: AppColors.lightColor,
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.secondaryColor.withOpacity(0.6))),
                      ),
                      const SizedBox(width: 8)
                    ],
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
