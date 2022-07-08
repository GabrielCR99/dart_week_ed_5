import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/ui/formatter_helper.dart';
import '../../../core/ui/widgets/custom_app_bar.dart';
import '../../../models/order_pix.dart';

class PixPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;

  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_orderPix.image).data;

    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headline4,
                ),
                Text(
                  FormatterHelper.format(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.heightTransformer(reducedBy: 50),
                ),
                TextButton(
                  onPressed: _onPressedCopyPix,
                  style: TextButton.styleFrom(primary: Colors.grey),
                  child: Text(
                    'PIX Copia e Cola',
                    style: context.textTheme.headline4?.copyWith(
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPressedCopyPix() {
    Clipboard.setData(ClipboardData(text: _orderPix.code));
    Get.rawSnackbar(message: 'Código PIX copiado!');
  }
}
