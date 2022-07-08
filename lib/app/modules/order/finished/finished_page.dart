import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/widgets/primary_button.dart';
import '../../../models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _pix = Get.arguments;

  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  height: context.heightTransformer(reducedBy: 70),
                  width: context.widthTransformer(reducedBy: 50),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pedido realizado com sucesso',
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline6
                        ?.copyWith(color: context.theme.primaryColorDark),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 30),
                  child: PrimaryButton(
                    label: 'PIX',
                    onPressed: () =>
                        Get.toNamed('/orders/pix', arguments: _pix),
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: context.widthTransformer(reducedBy: 10),
                  child: PrimaryButton(
                    label: 'Fechar',
                    onPressed: () => Get.offAllNamed('/home'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
