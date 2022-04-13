import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_shop/feature/domain/entities/item_entities/colors_entity.dart';

class OrderedItemsWidget extends StatelessWidget {
  const OrderedItemsWidget({
    Key? key,
    required this.price,
    required this.id,
    required this.quantity,
    required this.title,
    required this.url,
    required this.colors,
  }) : super(key: key);
  final int? price;
  final int? id;
  final int? quantity;
  final String? title;
  final String? url;
  final List<ColorsEnt?>? colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 80,
              width: 80,
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  '$url',
                  height: 250,
                  width: 150,
                ),
              ),
            ),
            SizedBox(
              width: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$title',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    '$price ₽',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: colors!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            color: HexColor('${colors![index]?.code}'),
                            shape: BoxShape.circle,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 5,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}