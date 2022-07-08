import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../../core/ui/formatter_helper.dart';
import '../../../core/ui/widgets/plus_minus_box.dart';
import '../../../core/ui/widgets/primary_button.dart';
import 'shopping_cart_controller.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  final formKey = GlobalKey<FormState>();

  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Obx(
                    () => Visibility(
                      visible: controller.products.isNotEmpty,
                      replacement: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Carrinho',
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Nenhum item adicionado no carrinho'),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Carrinho',
                                  style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.clear,
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: controller.products
                                .map(
                                  (p) => Container(
                                    margin: const EdgeInsets.all(10),
                                    child: PlusMinusBox(
                                      label: p.product.name,
                                      elevated: true,
                                      backgroundColor: Colors.white,
                                      amount: p.amount,
                                      price: p.amount * p.product.price,
                                      plusCallback: () =>
                                          controller.addAmountInProduct(p),
                                      minusCallback: () =>
                                          controller.removeAmountInProduct(p),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total do pedido',
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  FormatterHelper.format(
                                    controller.totalValue,
                                  ),
                                  style: context.textTheme.bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const _AddressField(),
                          const Divider(),
                          _CpfField(),
                          const Divider(),
                          const Spacer(),
                          Center(
                            child: SizedBox(
                              width: context.widthTransformer(reducedBy: 10),
                              child: PrimaryButton(
                                label: 'FINALIZAR',
                                onPressed: _onPressedFinishOrder,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onPressedFinishOrder() {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      controller.createOrder();
    }
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'CPF',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => controller.cpf = value,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'^\s')),
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
            validator: Validatorless.multiple(
              [
                Validatorless.required('CPF obrigatório'),
                Validatorless.cpf('CPF inválido'),
              ],
            ),
            decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => controller.address = value,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'^\s')),
            ],
            validator: Validatorless.required('Endereço obrigatório'),
            decoration: const InputDecoration(
              hintText: 'Digite um endereço',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
