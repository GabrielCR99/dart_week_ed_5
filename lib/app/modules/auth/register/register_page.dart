import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/app_state.dart';
import '../../../core/ui/widgets/custom_app_bar.dart';
import '../../../core/ui/widgets/custom_text_form_field.dart';
import '../../../core/ui/widgets/primary_button.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends AppState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'Cadastro',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                Text(
                  'Preencha os campos abaixo para criar o  seu cadastro.',
                  style: context.textTheme.bodyText1,
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Nome',
                  keyboardType: TextInputType.name,
                  controller: _nameEC,
                  validator: Validatorless.required('Nome obrigatório'),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Email',
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
                  controller: _passwordEC,
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Senha obrigatória'),
                    Validatorless.min(6, 'Deve conter pelo menos 6 carecteres'),
                  ]),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  label: 'Confirmar senha',
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('Campo obrigatório'),
                    Validatorless.compare(_passwordEC, 'Senhas diferem'),
                  ]),
                ),
                const SizedBox(height: 50),
                PrimaryButton(
                  label: 'Cadastrar',
                  width: context.width,
                  onPressed: () {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      controller.register(
                        name: _nameEC.text,
                        email: _emailEC.text,
                        password: _passwordEC.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
