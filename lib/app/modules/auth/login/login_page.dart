import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/app_state.dart';
import '../../../core/ui/vakinha_ui.dart';
import '../../../core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/custom_text_form_field.dart';
import '../../../core/ui/widgets/primary_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends AppState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomTextFormField(
                          label: 'E-mail',
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatório'),
                            Validatorless.email('E-mail inválido'),
                          ]),
                        ),
                        const SizedBox(height: 30),
                        CustomTextFormField(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatória'),
                            Validatorless.min(
                              6,
                              'Deve conter pelo menos 6 carecteres',
                            ),
                          ]),
                        ),
                        const SizedBox(height: 50),
                        PrimaryButton(
                          label: 'Entrar',
                          width: context.width,
                          onPressed: _onPressedLogin,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui uma conta?'),
                            TextButton(
                              onPressed: () => Get.toNamed('/auth/register'),
                              child: const Text(
                                'Cadastre-se',
                                style: VakinhaUi.boldText,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  void _onPressedLogin() {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (formValid) {
      controller.login(
        email: _emailEC.text,
        password: _passwordEC.text,
      );
    }
  }
}
