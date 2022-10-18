import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../core/ui/formatter_helper.dart';
import '../../core/ui/vakinha_ui.dart';
import '../../core/ui/widgets/custom_app_bar.dart';
import '../../core/ui/widgets/plus_minus_box.dart';
import '../../core/ui/widgets/primary_button.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    child: FadeInImage.memoryNetwork(
                      fit: BoxFit.cover,
                      placeholder: kTransparentImage,
                      image:
                          'http://192.168.0.35:8080/images/${controller.product.image}',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => PlusMinusBox(
                      minusCallback: controller.removeProduct,
                      plusCallback: controller.addProduct,
                      amount: controller.amount,
                      price: controller.product.price,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Total', style: VakinhaUi.boldText),
                    trailing: Obx(
                      () => Text(
                        FormatterHelper.format(controller.totalPrice),
                        style: VakinhaUi.boldText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: PrimaryButton(
                        label: controller.hasAdded ? 'ATUALIZAR' : 'ADICIONAR',
                        onPressed: controller.addProductToCart,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
