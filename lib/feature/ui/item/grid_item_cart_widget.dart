import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_shop/feature/domain/entities/item_entities/items_entity.dart';
import 'package:my_shop/feature/presentation/cubit/item_card/item_card_page.dart';

class GridItemCart extends StatelessWidget {
  const GridItemCart({
    Key? key,
    required this.items,
  }) : super(key: key);

  final ItemsEnt items;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ItemCardPage(
              id: items.id,
            )),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Image.network(
              '${items.image?.file?.url}',
              height: 200,
              width: 300,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  '${items.title}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            Text(
              '${items.price} ₽',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(
              width: items.colors.length * 40,
              height: 20,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.colors.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: HexColor('${items.colors[index]?.code}'),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
