import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../core/ui/formatter_helper.dart';

import '../../../core/ui/vakinha_ui.dart';
import '../../../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: InkWell(
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: FadeInImage.memoryNetwork(
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                    image:
                        'http://dartweek.academiadoflutter.com.br/images/${product.image}',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.name,
                        style: VakinhaUi.boldText,
                      ),
                      Text(FormatterHelper.format(product.price)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
