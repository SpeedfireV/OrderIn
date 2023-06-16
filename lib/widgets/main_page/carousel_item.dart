import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/food_item_model.dart';
import 'package:meatingless/routing/router.dart';
import 'package:meatingless/services/functions/rating.dart';
import 'package:meatingless/services/ingredients.dart';
import 'package:numeral/numeral.dart';

import '../../services/functions/price.dart';
import '../../variables/colors.dart';

class CarouselItem extends ConsumerStatefulWidget {
  const CarouselItem({super.key, required this.item});
  final FoodItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarouselItemState();
}

class _CarouselItemState extends ConsumerState<CarouselItem> {
  @override
  Widget build(BuildContext context) {
    FoodItem item = widget.item;

    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            currentIngredients = item.ingredients;
            router.pushNamed("item", extra: item);
          },
          child: Ink(
            child: Image(
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage(item.mainImage),
            ),
          ),
        ),
      ),
      IgnorePointer(
        child: Container(
          height: double.infinity,
          width: 270,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.mainColor.withOpacity(0.6),
                    AppColors.mainColor.withOpacity(0)
                  ])),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IgnorePointer(
              child: SizedBox(
                width: 140,
                child: Text(
                  item.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(child: Container()),
            IgnorePointer(
              child: Text(
                "\$${price(item.price)}",
                style: TextStyle(
                    color: AppColors.lightColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 23),
              ),
            ),
            IgnorePointer(
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${rating(item.rating)} (${Numeral(item.numberOfRating).format()})",
                    style: TextStyle(
                        color: AppColors.lightColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(0, 50))),
                      onPressed: () {},
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                ),
                const SizedBox(width: 24),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    item.favourite
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    color: AppColors.lightColor,
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(50, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          AppColors.secondaryColor.withOpacity(0.6))),
                ),
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
