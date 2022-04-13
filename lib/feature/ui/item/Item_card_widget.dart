import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_shop/feature/domain/entities/item_entities/colors_entity.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({
    Key? key,
    required this.id,
    required this.url,
    required this.price,
    required this.colors,
    required this.title,
  }) : super(key: key);
  final String? url;
  final int? id;
  final int? price;
  final List<ColorsEnt?>? colors;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.network(
            '$url',
            height: 300,
            width: 400,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '$title',
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
            '$price ₽',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: colors!.length * 80,
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          color: HexColor('${colors![index]?.code}'),
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
